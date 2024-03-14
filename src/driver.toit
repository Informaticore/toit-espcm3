import serial
import i2c
import gpio
import pi4ioex

BUS0 ::= 0
BUS1 ::= 1

BUS0-SDA-PIN ::= 9
BUS0-SCL-PIN ::= 10
BUS1-SDA-PIN ::= 11
BUS1-SCL-PIN ::= 12

IOEX-A-I2C-ADDRESS ::= 0x20
IOEX-B-I2C-ADDRESS ::= 0x21

IO01 ::= 0  //E1_IO0_00
IO02 ::= 1  //E1_IO0_01
IO03 ::= 2  //E1_IO0_02
IO04 ::= 3  //E1_IO0_03
IO05 ::= 4  //E1_IO0_04
IO06 ::= 5  //E1_IO0_05
IO07 ::= 6  //E1_IO0_06
IO08 ::= 7  //E1_IO0_07
IO09 ::= 8  //E1_IO1_00
IO10 ::= 9  //E1_IO1_01
IO11 ::= 10 //E1_IO1_02
IO12 ::= 11 //E1_IO1_03
IO13 ::= 12 //E1_IO1_04
IO14 ::= 13 //E1_IO1_05
IO15 ::= 14 //E1_IO1_06
IO16 ::= 15 //E1_IO1_07
IO17 ::= 0  //E2_IO0_00
IO18 ::= 1  //E2_IO0_01
IO19 ::= 2  //E2_IO0_02
IO20 ::= 3  //E2_IO0_03
IO21 ::= 4  //E2_IO0_04
IO22 ::= 5  //E2_IO0_05
IO23 ::= 6  //E2_IO0_06
IO24 ::= 7  //E2_IO0_07
IO25 ::= 8  //E2_IO1_00
IO26 ::= 9  //E2_IO1_01
IO27 ::= 10 //E2_IO1_02
IO28 ::= 11 //E2_IO1_03
IO29 ::= 12 //E2_IO1_04
IO30 ::= 13 //E2_IO1_05
IO31 ::= 14 //E2_IO1_06
IO32 ::= 15 //E2_IO1_07

class ESPCM3Module:

  bus_ := ?
  ioA := ?
  ioB := ?

  constructor bus/int=BUS0:
    if bus == BUS0:
      bus_ = i2c.Bus
        --sda=gpio.Pin BUS0-SDA-PIN
        --scl=gpio.Pin BUS0-SCL-PIN
    else:
      bus_ = i2c.Bus
        --sda=gpio.Pin BUS1-SDA-PIN
        --scl=gpio.Pin BUS1-SCL-PIN 

    ioA = pi4ioex.PI4IOEX (bus_.device IOEX-A-I2C-ADDRESS)
    ioB = pi4ioex.PI4IOEX (bus_.device IOEX-B-I2C-ADDRESS)

  get-pin pin/int -> pi4ioex.Pin:
    assert: pin >= 0 and pin <= 32
    if pin < 16:
      return ioA.get-pin pin 0
    else:
      return ioB.get-pin pin % 16 0