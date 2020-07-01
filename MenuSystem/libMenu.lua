-- title: 	libMenu
-- author: Kozova1
-- desc:   A library that generates cool menu screens.
-- script: lua

MENU = {}
selected_idx = 1
DEFAULT_STYLE = {
	ENTRY = {
		TEXT = {
			small = false,
			scale = 1,
			fixed = false,
			color = 12,
			backgroundColor = 15
		},
		BORDER = {
			COLOR = 3,
			SELECTED_COLOR = 11,
			ON = true
		},
        SELECTION = {
            TRIANGLE_COLOR = 12
        }
	}
}

function MENU:addEntry(text, onChoose, stylesheet)
	if stylesheet == nil then stylesheet = DEFAULT_STYLE end
	table.insert(MENU, {
		text = text,
		width = print(text, -8000000, -8000000, 0, stylesheet.ENTRY.TEXT.fixed, stylesheet.ENTRY.TEXT.scale, stylesheet.ENTRY.TEXT.small),
		onExec = onChoose,
		style = stylesheet,
		selected = false
	})
end

function MENU:loop()
	-- Render the menu!
	local currentY = (136 - #self * 10) / 2
	if currentY < 0 then
		return nil
	end
	for i, entry in ipairs(self) do
		currX = 120 - entry.width / 2
		rect(currX, currentY+1, entry.width, 8, entry.style.ENTRY.TEXT.backgroundColor)
        if i == selected_idx then
			self[i].selected = true
        else
            self[i].selected = false
        end
		if entry.style.ENTRY.BORDER.ON then
			-- checking for selection
			if self[i].selected then
				-- drawing selected border
				rectb(currX - 1, currentY, entry.width + 2, 10, entry.style.ENTRY.BORDER.SELECTED_COLOR)
			else
				rectb(currX - 1, currentY, entry.width + 2, 10, entry.style.ENTRY.BORDER.COLOR)
			end
		end
        if self[i].selected then 
            local textHeight = MENU[i].style.ENTRY.TEXT.scale * 5
            tri(currX - 7, currentY,
                currX - 7, currentY + textHeight + 2,
                currX - 3, currentY + 1 + textHeight/2,
                self[i].style.ENTRY.SELECTION.TRIANGLE_COLOR
            )
        end
		print(entry.text, currX, currentY + 2,
			entry.style.ENTRY.TEXT.color,
			entry.style.ENTRY.TEXT.fixed,
			entry.style.ENTRY.TEXT.scale,
			entry.style.ENTRY.TEXT.small
		)
		currentY = currentY + 10
	end
	-- Moving the selection on presses
	if btnp(0) and selected_idx > 1 then
		selected_idx = selected_idx - 1
	elseif btnp(1) and selected_idx < #self then
		selected_idx = selected_idx + 1
	end
	if btnp(4) then
		self[selected_idx].onExec()
	end
end
