BINDS = {}
function BINDS:bind(keyCode, func, isContinuous, isKeyboard)
    -- Typechecking
    if isContinuous == nil then
        isContinuous = false
    else
        assert(type(isContinuous) == "boolean", "isContinuous must be nil or a boolean")
    end
    if isKeyboard == nil then
        isKeyboard = false
    else
        assert(type(isKeyboard) == "boolean", "isKeyboard must be nil or a boolean")
    end
    assert(keyCode ~= nil and func ~= nil, "keyCode and func must not be nil")
    assert(type(keyCode) == "number", "keyCode must be a number")
    assert(type(func) == "function", "func must be a function")
    assert(keyCode % 1 == 0 and keyCode >= 0, "keyCode must be a positive integer")
    table.insert(self, {
        key = keyCode,
        exec = func,
        onKeyboard = isKeyboard,
        isContinuous = isContinuous
    })
end

function BINDS:loop()
    for k, keyBind in ipairs(self) do
        if keyBind.onKeyboard then
            if keyBind.isContinuous then
                if key(keyBind.key) then keyBind.exec() end
            else
                if keyp(keyBind.key) then keyBind.exec() end
            end
        else
            if keyBind.isContinuous then
                if btn(keyBind.key) then keyBind.exec() end
            else
                if btnp(keyBind.key) then keyBind.exec() end
            end
        end
    end
end
