TIMERS = {}
function TIMERS:addTimer(interval, func)
    assert(func ~= nil, "func must not be nil")
    assert(type(func) == "function", "func must be a callback function")
    assert(interval ~= nil, "interval must not be nil")
    assert(type(interval) == "number", "interval must be a number")
    assert(interval % 1 == 0, "interval must be a positive integer")
    assert(interval > 0, "interval must be bigger than 0")

    table.insert(self, {
        modT = interval,
        run = func
    })
end

function TIMERS:tick(t)
    assert(t ~= nil, "t must not be nil")
    assert(type(t) == "number", "t must be a number")
    for i = 1, #self do
        local timer = self[i]
        if t % timer.modT == 0 then
            timer.run()
        end
    end
end
