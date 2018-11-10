--setup inital trigger
gpio.mode(7,gpio.INT)
start=0
fin=0
gpio.trig(7,"up", function ()
    start= tmr.now()
    print("Trigger Start")
    gpio.trig(7,"down", function()
        fin=tmr.now()
        print("trigger End length was")
        print(fin - start)
        end
    )
    end
)
--setup a new second trigger wating for the pulse to end

--count the time lapsed between the 2 triggers