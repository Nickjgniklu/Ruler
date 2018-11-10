-- put a pin in iterupt mode
gpio.mode(7,gpio.INPUT)
gpio.write(7,gpio.LOW)
gpio.mode(7,gpio.INT)
--trigger function on pin going from 0 to 3 volts
gpio.trig(7, "up" ,function ()
    print("Interupt Triggered")
    end
    )
