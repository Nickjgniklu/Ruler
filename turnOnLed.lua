gpio.mode(0, gpio.OUTPUT)
--the built in led is inverted
gpio.write(0, gpio.LOW)
print("test")