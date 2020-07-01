# libMenu
To use libMenu, you have to add the following snippet to your TIC function:  
```lua
MENU:loop()
```

To add an entry to the menu, use the function MENU:addEntry *once per each entry* with the following parameters:
- text: a `string` that contains the text that will be displayed in the entry.  
- onChoose: a `function` that takes 0 parameters and will run *once* when the menu entry is selected and activated.  
- stylesheet: a `table` (can be `nil`, in which case it will use the default style. Missing keys can cause a crash, so make sure that your styleTable is complete!) that defines various properties about the button. For more info, look at [DEFAULT_STYLE in libMenu.lua](./libMenu.lua).  
