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
  