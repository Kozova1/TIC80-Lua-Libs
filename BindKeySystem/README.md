# libBindKey
To use libBindKey, add this snippet to your TIC function:  
```lua
BINDS:loop()
```

To add a keybind, call the function BINDS:bind() with parameters:
- keyCode: an `int` that signifies the key that you want to trigger the bind, either from the [keymap](https://github.com/nesbox/TIC-80/wiki/key-map) or from the special [map for key()](https://github.com/nesbox/TIC-80/wiki/key#parameters).  
- func: a `function` with 0 parameters that will run each time that the bind is triggered.  
- isContinuous: a `boolean` that toggles whether holding down the specified key will repeatedly trigger the bind. (By default, set to false).  
  - false: Key has to be clicked individually each time.  
  - true:  Key can be held down and triggered repeatedly.  
- isKeyboard: a `boolean` that toggles whether to use the special map for key() or the normal one. (By default, set to false).  
  - false: keyCode is treated as if it were a parameter to btn().  
  - true:  keyCode is treated as if it were a parameter to key().  
