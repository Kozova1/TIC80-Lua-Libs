GUI={}DEFAULT_STYLE={button={color=2,border={color=11,on=true}},label={color=12,fixed=false,scale=1,smallfont=false},rect={color=15,border={on=true,color=12}}}function GUI:doBtnClick(a,b,c)for d=1,#self do local e=self[d]if e.type=='button'then if a>=e.x and a<=e.x+e.w then if b>=e.y and b<=e.y+e.h then if c then e.clicked()end end end end end end;function GUI:loop(f,g,h)for d=1,#self do local e=self[d]if e.type=='button'then rect(e.x+1,e.y,e.w+1,e.h,e.style.button.color)if e.style.button.border.on then rectb(e.x,e.y-1,e.w+3,e.h+2,e.style.button.border.color)end;print(e.txt,e.x+1,e.y+1)elseif e.type=='label'then print(e.txt,e.x,e.y,e.style.label.color,e.style.label.fixed,e.style.label.scale,e.style.label.smallfont)elseif e.type=='rect'then if e.style.rect.border.on then rectb(e.x,e.y,e.w,e.h,e.style.rect.border.color)end;rect(e.x+1,e.y+1,e.w-2,e.h-2,e.style.rect.color)end end;GUI:doBtnClick(f,g,h)end;function GUI:button(i,j,k,l,m)if m==nil then m=DEFAULT_STYLE end;if l==nil then l=function()end end;table.insert(self,{txt=i,x=j,y=k,w=print(i,-800000,-80000),h=7,style=m,clicked=l,type='button'})end;function GUI:label(i,j,k,m)if m==nil then m=DEFAULT_STYLE end;table.insert(self,{txt=i,x=j,y=k,style=m,type='label'})end;function GUI:rect(j,k,n,o,p)if p==nil then p=DEFAULT_STYLE end;assert(j~=nil and k~=nil and n~=nil and o~=nil,"None of the parameters x,y,w,h can be null")table.insert(self,{x=j,y=k,h=o,w=n,style=p,type='rect'})end