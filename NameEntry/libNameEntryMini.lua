local a=(240-11*10)/2;local b=(136-9)/2;local c=" ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"local d={}for e=1,c:len()do table.insert(d,c:sub(e,e))end;local NAME={' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}local g=1;local function h(i)for e=1,#d do if d[e]==i then return e end end end;local function j(i)n=""for e=1,#i do n=n..tostring(i[e])end;return n end;function NAME:loop(k)local l=print("Enter Your Name:",-80000,-80000)print("Enter Your Name:",(240-l)/2,20,6)local m=h(self[g])if btnp(0,120,6)then m=m-1;if m<=0 then m=#d+m end;self[g]=d[m]elseif btnp(1,120,6)then m=m+1;if m>#d then m=m%#d end;self[g]=d[m]elseif btnp(2)then g=g-1;if g<=0 then g=#self+g end elseif btnp(3)then g=g+1;if g>#self then g=g-#self end end;for e=1,#self do if g==e then rectb(a+(e-1)*11,b,10,9,5)tri(a+(e-1)*11,b-2,a+(e-1)*11+9,b-2,a+(e-1)*11+4.5,b-8,12)tri(a+(e-1)*11,b+2+8,a+(e-1)*11+9,b+8+2,a+(e-1)*11+4.5,b+8+8,12)else rectb(a+(e-1)*11,b,10,9,8)end;print(self[e],a+(e-1)*11+3,b+2,12)end;if g==#self then print("SUBMIT: Z",a+11*#self+5,b+2,2)end;if btnp(4)then k(j(self))end end;local o,p=1,1
