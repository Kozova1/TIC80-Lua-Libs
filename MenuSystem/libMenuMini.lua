MENU={}selected_idx=1;DEFAULT_STYLE={ENTRY={TEXT={small=false,scale=1,fixed=false,color=12,backgroundColor=15},BORDER={COLOR=3,SELECTED_COLOR=11,ON=true},SELECTION={TRIANGLE_COLOR=12}}}function MENU:addEntry(a,b,c)if c==nil then c=DEFAULT_STYLE end;table.insert(MENU,{text=a,width=print(a,-8000000,-8000000,0,c.ENTRY.TEXT.fixed,c.ENTRY.TEXT.scale,c.ENTRY.TEXT.small),onExec=b,style=c,selected=false})end;function MENU:loop()local d=(136-#self*10)/2;if d<0 then return nil end;for e,f in ipairs(self)do currX=120-f.width/2;rect(currX,d+1,f.width,8,f.style.ENTRY.TEXT.backgroundColor)if e==selected_idx then self[e].selected=true else self[e].selected=false end;if f.style.ENTRY.BORDER.ON then if self[e].selected then rectb(currX-1,d,f.width+2,10,f.style.ENTRY.BORDER.SELECTED_COLOR)else rectb(currX-1,d,f.width+2,10,f.style.ENTRY.BORDER.COLOR)end end;if self[e].selected then local g=MENU[e].style.ENTRY.TEXT.scale*5;tri(currX-7,d,currX-7,d+g+2,currX-3,d+1+g/2,self[e].style.ENTRY.SELECTION.TRIANGLE_COLOR)end;print(f.text,currX,d+2,f.style.ENTRY.TEXT.color,f.style.ENTRY.TEXT.fixed,f.style.ENTRY.TEXT.scale,f.style.ENTRY.TEXT.small)d=d+10 end;if btnp(0)and selected_idx>1 then selected_idx=selected_idx-1 elseif btnp(1)and selected_idx<#self then selected_idx=selected_idx+1 end;if btnp(4)then self[selected_idx].onExec()end end