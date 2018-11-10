--for PARRALLAX PING SENSOR

--to use this senore we send a small pulse
--then on the smae pin wait to hear a ulse back and measure the length of the pulse

--send small pulse
pin=7
start=0
fin=0

-- level is current state of pin 
--when is timestamp
--count --- number of times triggerd
function event(level,when,count)
    if level == gpio.HIGH then
        start=when
    elseif level == gpio.LOW then
        fin =when
        print("The distance measured in inches is")
        print((fin-start)/74/2)
    end

end
function sendPulse()
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,gpio.LOW)
    tmr.delay(2)
    gpio.write(pin,gpio.HIGH)
    tmr.delay(5)
end

sendPulse()
-- after the out pules there are 750uS until we have 
--to be ready for the input pulse to come in
-- listen for pulse

gpio.mode(pin,gpio.INT)--170S for this
gpio.trig(pin,"both", event)--??second dont do anon function takes too long!

