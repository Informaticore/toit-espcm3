# ESP-CM3 Library
Library to control make it easier to controll an ESP-CM3-S2 or S3 Board. The library abstracts the usage of the GPIO-Expanders.

## Usage
```
import espcm3

main:
  print "ESP32 toit"
  espcm3_ := espcm3.ESPCM3Module //initialises the ESP32 module using the I2C bus 0 (default)

  io01 := espcm3_.get-pin espcm3.IO02 //returns the pin IO01 (as seen on the programmer board)

  while true:
    io01.on
    sleep --ms=1000
    io01.off
    sleep --ms=1000
```

By default the moduels are connected using I2C Bus 0. This can be changed with solder-jumpers on the module itself. If so you can initialise the ESPCM3Module also with `espcm3.BUS1` like `espcm3_ := espcm3.ESPCM3Module espcm3.BUS1`