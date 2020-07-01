# libNameEntry
To use libNameEntry, you must add the following snippet to the TIC function:  
```lua
NAME:loop(callback)
```
Where callback is a `function` that takes exactly 1 parameter, which is a `string` and contains the name that was read. Empty spaces are just the space (' ') character, and the string is exactly 10 characters long.
