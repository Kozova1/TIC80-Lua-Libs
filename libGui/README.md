# libGui
To use libGui, you need to add the following snippet to the start of your TIC function:  
```lua
-- see https://github.com/nesbox/TIC-80/wiki/mouse
local mx, my, ml, mrest = mouse()
GUI:loop(mx, my, ml)
```


To add a button, run the function GUI:button() *once* with the following parameters:  
- text: a `string` that will be displayed on the button.  
- x: an `int` between 0 and 240 that specifies the X coordinate of the upper left corner of the button.  
- y: an `int` between 0 and 136 that specifies the Y coordinate of the upper left corner of the button.  
- onClick: a `function` (can be `nil`, will cause no event to be bound) that will be called every frame while the button is held down. 
- styleTable: a `table` (can be `nil`, in which case it will use the default style. Missing keys can cause a crash, so make sure that your styleTable is complete!) that defines various properties about the button. For more info, look at [DEFAULT_STYLE in libGui.lua](./libGui.lua).  

To add a label, run the function GUI:label() *once* with the following parameters:  
- text: a `string` that will be the label.  
- x: an `int` between 0 and 240 that specifies the X coordinate of the upper left corner of the label.  
- y: an `int` between 0 and 136 that specifies the Y coordinate of the upper left corner of the label.  
- styleTable: a `table` (can be `nil`, in which case it will use the default style. Missing keys can cause a crash, so make sure that your styleTable is complete!) that defines various properties about the button. For more info, look at [DEFAULT_STYLE in libGui.lua](./libGui.lua).  

To add a primitive rectangle, run the function GUI:rect() *once* with the following parameters:
- x: an `int` between 0 and 240 that specifies the X coordinate of the upper left corner of the rectangle.  
- y: an `int` between 0 and 136 that specifies the Y coordinate of the upper left corner of the rectangle.  
- w: an `int` that will be the width of the rectangle.  
- h: an `int` that will be the height of the rectangle.  
- styleTable: a `table` (can be `nil`, in which case it will use the default style. Missing keys can cause a crash, so make sure that your styleTable is complete!) that defines various properties about the button. For more info, look at [DEFAULT_STYLE in libGui.lua](./libGui.lua).  
