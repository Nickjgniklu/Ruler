--gerate pulse with delay
gpio.mode(0,gpio.OUTPUT)
gpio.write(0,gpio.LOW)
tmr.delay(500000)
gpio.write(0,gpio.HIGH)
tmr.delay(1000000)
