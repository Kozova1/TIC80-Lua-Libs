GUI = {}
DEFAULT_STYLE = {
    button = {
        color = 2,
        border = {
            color = 11,
            on = true
        }
    },
    label = {
        color = 12,
        fixed = false,
        scale = 1,
        smallfont = false
    },
    rect = {
        color = 15,
        border = {
            on = true,
            color = 12
        }
    }
}
function GUI:doBtnClick(mouseX, mouseY, mouseLeft)
    for i = 1, #self do
        local obj = self[i]
        if obj.type == 'button' then
            if mouseX >= obj.x and mouseX <= obj.x+obj.w then
                if mouseY >= obj.y and mouseY <= obj.y+obj.h then
                    if mouseLeft then
                        obj.clicked()
                    end
                end
            end
        end
    end
end
function GUI:loop(mx, my, ml)
    -- Draw all elements
    for i = 1, #self do
        local obj = self[i]
        if obj.type == 'button' then
            rect(obj.x+1, obj.y, obj.w+1, obj.h, obj.style.button.color)
            if obj.style.button.border.on then
                rectb(obj.x, obj.y-1, obj.w+3, obj.h+2, obj.style.button.border.color)
            end
            print(obj.txt, obj.x+1, obj.y+1)
        elseif obj.type == 'label' then
            print(
                obj.txt,
                obj.x,
                obj.y,
                obj.style.label.color,
                obj.style.label.fixed,
                obj.style.label.scale,
                obj.style.label.smallfont
            )
        elseif obj.type == 'rect' then
            if obj.style.rect.border.on then
                rectb(obj.x, obj.y, obj.w, obj.h, obj.style.rect.border.color)
            end
            rect(obj.x+1, obj.y+1, obj.w-2, obj.h-2, obj.style.rect.color)
        end
    end
    -- Handle button onClick events
    GUI:doBtnClick(mx, my, ml)
end
function GUI:button(text, x, y, onClick, styleTable)
    if styleTable == nil then
        styleTable = DEFAULT_STYLE
    end
    if onClick == nil then
        onClick = function() end
    end
    table.insert(self, {
        txt = text,
        x = x,
        y = y,
        w = print(text, -800000, -80000),
        h = 7,
        style = styleTable,
        clicked = onClick,
        type = 'button'
    })
end
function GUI:label(text, x, y, styleTable)
    if styleTable == nil then
        styleTable = DEFAULT_STYLE
    end
    table.insert(self, {
        txt = text,
        x = x,
        y = y,
        style = styleTable,
        type = 'label'
    })
end
function GUI:rect(x, y, w, h, styleSheet)
    if styleSheet == nil then
        styleSheet = DEFAULT_STYLE
    end
    assert(
        x ~= nil and
        y ~= nil and
        w ~= nil and
        h ~= nil,
        "None of the parameters x,y,w,h can be null"
    )
    table.insert(self, {
        x = x,
        y = y,
        h = h,
        w = w,
        style = styleSheet,
        type = 'rect'
    })
end
