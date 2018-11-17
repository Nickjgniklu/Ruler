--for PARRALLAX PING SENSOR

--to use this senore we send a small pulse
--then on the smae pin wait to hear a ulse back and measure the length of the pulse

-- pin to use
pin=7
-- for logging pulse time
start=0
fin=0

-- stores most recent distance
distance=-1

-- level is current state of pin 
--when is timestamp
--count --- number of times triggerd
function pulseEvent(level,when,count)
    if level == gpio.HIGH then
        start=when
    elseif level == gpio.LOW then
        fin =when
        distance=(fin-start)/74/2
    end

end
function sendPulse()
    gpio.mode(pin,gpio.OUTPUT)
    gpio.write(pin,gpio.LOW)
    tmr.delay(2)
    gpio.write(pin,gpio.HIGH)
    tmr.delay(5)
end
function measureDistance()
    sendPulse()
    -- after the out pules there are 750uS until we have 
    --to be ready for the input pulse to come in
    -- listen for pulse
    gpio.mode(pin,gpio.INT)
    gpio.trig(pin,"both", pulseEvent)--??second dont do anon function takes too long!
end
function printDistance()-- call measure print result and then send data to server
measureDistance()
-- this takes time to update we must wait
-- print 50 milliseconds later
tmr.alarm(1,50,tmr.ALARM_SINGLE, function ()
        print("Distance="..distance)
    end
)
http.get("http://10.0.0.199:8000/ruler/set?".."distance="..math.floor(distance),nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data) 
    end
  end)
end
--schedule to print the distance 10 time per second
tmr.alarm(2,250,tmr.ALARM_AUTO,printDistance)
