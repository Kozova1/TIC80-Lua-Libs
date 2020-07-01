# libTimer
To use libTimer, you have to add the following snippet to the TIC function:  
```lua
TIMERS:tic(t)
```
Where t is an `int` that is incremented by exactly 1 every frame.  
To register a timer, use the TIMERS:addTimer() function, with parameters:  
- interval: an `int` that specifies when the timer will trigger. An interval of 10 means that the timer will trigger every time that t divides by 10 with no remainder.  
- func: a `function` that will be called each time that the timer triggers.  
