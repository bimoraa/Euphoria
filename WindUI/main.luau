local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()





local b=game:GetService"RunService"local c=
b.Heartbeat
local d=game:GetService"UserInputService"
local e=game:GetService"TweenService"

local f=loadstring(game:HttpGetAsync"https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua")()
f.SetIconsType"lucide"

local g={
Font="rbxassetid://12187365364",
CanDraggable=true,
Theme=nil,
Themes=nil,
WindUI=nil,
Signals={},
Objects={},
FontObjects={},
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
}
}

function g.Init(h)
g.WindUI=h
end


function g.AddSignal(h,i)
table.insert(g.Signals,h:Connect(i))
end

function g.DisconnectAll()
for h,i in next,g.Signals do
local j=table.remove(g.Signals,h)
j:Disconnect()
end
end


function g.SafeCallback(h,...)
if not h then
return
end

local i,j=pcall(h,...)
if not i then local
k, l=j:find":%d+: "


warn("[ WindUI: DEBUG Mode ] "..j)

return g.WindUI:Notify{
Title="DEBUG Mode: Error",
Content=not l and j or j:sub(l+1),
Duration=8,
}
end
end

function g.SetTheme(h)
g.Theme=h
g.UpdateTheme(nil,true)
end

function g.AddFontObject(h)
table.insert(g.FontObjects,h)
g.UpdateFont(g.Font)
end

function g.UpdateFont(h)
g.Font=h
for i,j in next,g.FontObjects do
j.FontFace=Font.new(h,j.FontFace.Weight,j.FontFace.Style)
end
end

function g.GetThemeProperty(h,i)
return i[h]or g.Themes.Dark[h]
end

function g.AddThemeObject(h,i)
g.Objects[h]={Object=h,Properties=i}
g.UpdateTheme(h,false)
return h
end

function g.UpdateTheme(h,i)
local function ApplyTheme(j)
for k,l in pairs(j.Properties or{})do
local m=g.GetThemeProperty(l,g.Theme)
if m then
if not i then
j.Object[k]=Color3.fromHex(m)
else
g.Tween(j.Object,0.08,{[k]=Color3.fromHex(m)}):Play()
end
end
end
end

if h then
local j=g.Objects[h]
if j then
ApplyTheme(j)
end
else
for j,k in pairs(g.Objects)do
ApplyTheme(k)
end
end
end

function g.Icon(h)
return f.Icon(h)
end

function g.New(h,i,j)
local k=Instance.new(h)

for l,m in next,g.DefaultProperties[h]or{}do
k[l]=m
end

for l,m in next,i or{}do
if l~="ThemeTag"then
k[l]=m
end
end

for l,m in next,j or{}do
m.Parent=k
end

if i and i.ThemeTag then
g.AddThemeObject(k,i.ThemeTag)
end
if i and i.FontFace then
g.AddFontObject(k)
end
return k
end

function g.Tween(h,i,j,...)
return e:Create(h,TweenInfo.new(i,...),j)
end

function g.NewRoundFrame(h,i,j,k,l)






local m=g.New(l and"ImageButton"or"ImageLabel",{
Image=i=="Squircle"and"rbxassetid://80999662900595"
or i=="SquircleOutline"and"rbxassetid://117788349049947"
or i=="SquircleOutline2"and"rbxassetid://117817408534198"
or i=="Shadow-sm"and"rbxassetid://84825982946844"
or i=="Squircle-TL-TR"and"rbxassetid://73569156276236",
ScaleType="Slice",
SliceCenter=i~="Shadow-sm"and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=j.ThemeTag and j.ThemeTag
},k)

for n,o in pairs(j or{})do
if n~="ThemeTag"then
m[n]=o
end
end

local function UpdateSliceScale(n)
local o=i~="Shadow-sm"and(n/(256))or(n/512)
m.SliceScale=o
end

UpdateSliceScale(h)

return m
end

local h=g.New local i=
g.Tween

function g.SetDraggable(j)
g.CanDraggable=j
end

function g.Drag(j,k,l)
local m
local n,o,p,q
local r={
CanDraggable=true
}

if not k or type(k)~="table"then
k={j}
end

local function update(s)
local t=s.Position-p
g.Tween(j,0.02,{Position=UDim2.new(
q.X.Scale,q.X.Offset+t.X,
q.Y.Scale,q.Y.Offset+t.Y
)}):Play()
end

for s,t in pairs(k)do
t.InputBegan:Connect(function(u)
if(u.UserInputType==Enum.UserInputType.MouseButton1 or u.UserInputType==Enum.UserInputType.Touch)and r.CanDraggable then
if m==nil then
m=t
n=true
p=u.Position
q=j.Position

if l and type(l)=="function"then
l(true,m)
end

u.Changed:Connect(function()
if u.UserInputState==Enum.UserInputState.End then
n=false
m=nil

if l and type(l)=="function"then
l(false,m)
end
end
end)
end
end
end)

t.InputChanged:Connect(function(u)
if m==t and n then
if u.UserInputType==Enum.UserInputType.MouseMovement or u.UserInputType==Enum.UserInputType.Touch then
o=u
end
end
end)
end

d.InputChanged:Connect(function(s)
if s==o and n and m~=nil then
if r.CanDraggable then
update(s)
end
end
end)

function r.Set(s,t)
r.CanDraggable=t
end

return r
end

function g.Image(j,k,l,m,n,o,p)
local function SanitizeFilename(q)
q=q:gsub("[%s/\\:*?\"<>|]+","-")
q=q:gsub("[^%w%-_%.]","")
return q
end

m=m or"Temp"
k=SanitizeFilename(k)

local q=h("Frame",{
Size=UDim2.new(0,0,0,0),

BackgroundTransparency=1,
},{
h("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(g.Icon(j)or p)and{
ImageColor3=o and"Icon"
}or nil,
},{
h("UICorner",{
CornerRadius=UDim.new(0,l)
})
})
})
if g.Icon(j)then
q.ImageLabel.Image=g.Icon(j)[1]
q.ImageLabel.ImageRectOffset=g.Icon(j)[2].ImageRectPosition
q.ImageLabel.ImageRectSize=g.Icon(j)[2].ImageRectSize
end
if string.find(j,"http")then
local r="WindUI/"..m.."/Assets/."..n.."-"..k..".png"
local s,t=pcall(function()
task.spawn(function()
if not isfile(r)then
local s=g.Request{
Url=j,
Method="GET",
}.Body

writefile(r,s)
end
q.ImageLabel.Image=getcustomasset(r)
end)
end)
if not s then
warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..t)

q:Destroy()
end
elseif string.find(j,"rbxassetid")then
q.ImageLabel.Image=j
end

return q
end

return g end function a.b()
return{
Dark={
Name="Dark",
Accent="#18181b",
Dialog="#18181b",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#999999",
Background="#101010",
Button="#52525b",
Icon="#a1a1aa",
},
Light={
Name="Light",
Accent="#FFFFFF",
Dialog="#f4f4f5",
Outline="#09090b",
Text="#000000",
Placeholder="#777777",
Background="#e4e4e7",
Button="#18181b",
Icon="#52525b",
},
Rose={
Name="Rose",
Accent="#f43f5e",
Outline="#ffe4e6",
Text="#ffe4e6",
Placeholder="#fda4af",
Background="#881337",
Button="#e11d48",
Icon="#fecdd3",
},
Plant={
Name="Plant",
Accent="#22c55e",
Outline="#dcfce7",
Text="#dcfce7",
Placeholder="#bbf7d0",
Background="#14532d",
Button="#22c55e",
Icon="#86efac",
},
Red={
Name="Red",
Accent="#ef4444",
Outline="#fee2e2",
Text="#ffe4e6",
Placeholder="#fca5a5",
Background="#7f1d1d",
Button="#ef4444",
Icon="#fecaca",
},
Indigo={
Name="Indigo",
Accent="#6366f1",
Outline="#e0e7ff",
Text="#e0e7ff",
Placeholder="#a5b4fc",
Background="#312e81",
Button="#6366f1",
Icon="#c7d2fe",
},
Sky={
Name="Sky",
Accent="#0ea5e9",
Outline="#e0f2fe",
Text="#e0f2fe",
Placeholder="#7dd3fc",
Background="#075985",
Button="#0ea5e9",
Icon="#bae6fd",
},
Violet={
Name="Violet",
Accent="#8b5cf6",
Outline="#ede9fe",
Text="#ede9fe",
Placeholder="#c4b5fd",
Background="#4c1d95",
Button="#8b5cf6",
Icon="#ddd6fe",
},
Amber={
Name="Amber",
Accent="#f59e0b",
Outline="#fef3c7",
Text="#fef3c7",
Placeholder="#fcd34d",
Background="#78350f",
Button="#f59e0b",
Icon="#fde68a",
},
Emerald={
Name="Emerald",
Accent="#10b981",
Outline="#d1fae5",
Text="#d1fae5",
Placeholder="#6ee7b7",
Background="#064e3b",
Button="#10b981",
Icon="#a7f3d0",
},
}end function a.c()



local b={
Flags={},
Values={}
}


function b.Register(d,e,f)
if not e or e==""then
return false
end

d.Flags[e]=f


if f.Value~=nil then
d.Values[e]=f.Value
elseif f.Default~=nil then
d.Values[e]=f.Default
end

return true
end


function b.GetFlag(d,e)
return d.Values[e]
end


function b.SetFlag(d,e,f)
if d.Flags[e]then
d.Values[e]=f


local g=d.Flags[e]
if g and g.Set then
g:Set(f)
elseif g and g.Update then
g:Update(f)
elseif g and g.Select then
g:Select(f)
end

return true
end

return false
end


function b.GetAllFlags(d)
return d.Values
end


function b.OnFlagChanged(d,e,f)
if not d.Flags[e]then
return false
end

local g=d.Flags[e]
if g then

local h=g.Callback


g.Callback=function(i)

d.Values[e]=i


if f then
f(i)
end


if h then
h(i)
end
end
end

return true
end


function b.RemoveFlag(d,e)
if d.Flags[e]then
d.Flags[e]=nil
d.Values[e]=nil
return true
end

return false
end


function b.ClearAll(d)
d.Flags={}
d.Values={}
end

return b end function a.d()

local b={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function b.New(g,h,i,j,k,l,m)
j=j or"Primary"
local n=not m and 10 or 99
local o
if h and h~=""then
o=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local p=e("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=k,
BackgroundTransparency=1
},{
d.NewRoundFrame(n,"Squircle",{
ThemeTag={
ImageColor3=j~="White"and"Button"or nil,
},
ImageColor3=j=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=j=="Primary"and 0 or j=="White"and 0 or 1
}),

d.NewRoundFrame(n,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=j=="Secondary"and 0.95 or 1
}),

d.NewRoundFrame(n,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",
ImageTransparency=j=="Secondary"and 0 or 1,
Visible=not m
}),

d.NewRoundFrame(n,not m and"SquircleOutline"or"SquircleOutline2",{
ThemeTag={
ImageColor3=j~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=j=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=j=="Primary"and.95 or.85,
Name="SquircleOutline",
}),

d.NewRoundFrame(n,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=j~="White"and"Text"or nil
},
ImageColor3=j=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
e("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
o,
e("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
Text=g or"Button",
ThemeTag={
TextColor3=(j~="Primary"and j~="White")and"Text",
},
TextColor3=j=="Primary"and Color3.new(1,1,1)or j=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

d.AddSignal(p.MouseEnter,function()
f(p.Frame,.047,{ImageTransparency=.95}):Play()
end)
d.AddSignal(p.MouseLeave,function()
f(p.Frame,.047,{ImageTransparency=1}):Play()
end)
d.AddSignal(p.MouseButton1Up,function()
if l then
l:Close()()
end
if i then
d.SafeCallback(i)
end
end)

return p
end


return b end function a.e()
local b={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function b.New(g,h,i,j,k)
j=j or"Input"
local l=10
local m
if h and h~=""then
m=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local n=j~="Input"

local o=e("TextBox",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(d.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,m and-29 or 0,1,0),
PlaceholderText=g,
ClearTextOnFocus=false,
ClipsDescendants=true,
TextWrapped=n,
MultiLine=n,
TextXAlignment="Left",
TextYAlignment=j=="Input"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local p=e("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=i,
BackgroundTransparency=1
},{
e("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
d.NewRoundFrame(l,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
d.NewRoundFrame(l,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
e("UIPadding",{
PaddingTop=UDim.new(0,j=="Input"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,j=="Input"and 0 or 12),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=j=="Input"and"Center"or"Top",
HorizontalAlignment="Left",
}),
m,
o,
})
})
})










d.AddSignal(o.FocusLost,function()
if k then
d.SafeCallback(k,o.Text)
end
end)

return p
end


return b end function a.f()
local b=a.load'a'
local d=b.New
local e=b.Tween

local f={
Holder=nil,
Window=nil,
Parent=nil,
}

function f.Init(g,h)
f.Window=g
f.Parent=h
return f
end

function f.Create(g)
local h={
UICorner=32,
UIPadding=12,
UIElements={}
}

if g then h.UIPadding=0 end
if g then h.UICorner=26 end

if not g then
h.UIElements.FullScreen=d("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=f.Parent or(f.Window and f.Window.UIElements and f.Window.UIElements.Main and f.Window.UIElements.Main.Main)
},{
d("UICorner",{
CornerRadius=UDim.new(0,f.Window.UICorner)
})
})
end

h.UIElements.Main=d("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3="Dialog",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
d("UIPadding",{
PaddingTop=UDim.new(0,h.UIPadding),
PaddingLeft=UDim.new(0,h.UIPadding),
PaddingRight=UDim.new(0,h.UIPadding),
PaddingBottom=UDim.new(0,h.UIPadding),
})
})

h.UIElements.MainContainer=b.NewRoundFrame(h.UICorner,"Squircle",{
Visible=false,

ImageTransparency=g and 0.15 or 0,
Parent=g and f.Parent or h.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3="Dialog"
},
ZIndex=9999,
},{





h.UIElements.Main,



b.NewRoundFrame(h.UICorner,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ThemeTag={
ImageColor3="Outline",
},
},{
d("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

function h.Open(i)
if not g then
h.UIElements.FullScreen.Visible=true
h.UIElements.FullScreen.Active=true
end

task.spawn(function()
h.UIElements.MainContainer.Visible=true

if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=.3}):Play()
end
e(h.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
h.UIElements.Main.Visible=true
end)
end)
end
function h.Close(i)
if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
h.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
h.UIElements.FullScreen.Visible=false
end)
end
h.UIElements.Main.Visible=false

e(h.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(.1)
if not g then
h.UIElements.FullScreen:Destroy()
else
h.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return h
end

return f end function a.g()
local b={}


local d=a.load'a'
local e=d.New local f=
d.Tween

local g=a.load'd'.New
local h=a.load'e'.New

function b.new(i,j,k)
local l=a.load'f'.Init(nil,i.WindUI.ScreenGui.KeySystem)
local m=l.Create(true)


local n

local o=200

local p=430
if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
p=430+(o/2)
end

m.UIElements.Main.AutomaticSize="Y"
m.UIElements.Main.Size=UDim2.new(0,p,0,0)

local q

if i.Icon then

q=d.Image(
i.Icon,
i.Title..":"..i.Icon,
0,
i.WindUI.Window,
"KeySystem",
i.IconThemed
)
q.Size=UDim2.new(0,24,0,24)
q.LayoutOrder=-1
end

local r=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=i.Title,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})
local s=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16
})

local t=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
q,r
})

local u=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





t,s,
})

local v=h("Enter Key","key",nil,"Input",function(v)
n=v
end)

local w
if i.KeySystem.Note and i.KeySystem.Note~=""then
w=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=i.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local x=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local y
if i.KeySystem.Thumbnail and i.KeySystem.Thumbnail.Image then
local z
if i.KeySystem.Thumbnail.Title then
z=e("TextLabel",{
Text=i.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
y=e("ImageLabel",{
Image=i.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,o,1,0),
Parent=m.UIElements.Main,
ScaleType="Crop"
},{
z,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,y and-o or 0,1,0),
Position=UDim2.new(0,y and o or 0,0,0),
BackgroundTransparency=1,
Parent=m.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
u,
w,
v,
x,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})





local z=g("Exit","log-out",function()
m:Close()()
end,"Tertiary",x.Frame)

if y then
z.Parent=y
z.Size=UDim2.new(0,0,0,42)
z.Position=UDim2.new(0,16,1,-16)
z.AnchorPoint=Vector2.new(0,1)
end

if i.KeySystem.URL then
g("Get key","key",function()
setclipboard(i.KeySystem.URL)
end,"Secondary",x.Frame)
end

local A=g("Submit","arrow-right",function()
local A=n
local B
if type(i.KeySystem.Key)=="table"then
B=table.find(i.KeySystem.Key,tostring(A))
else
B=tostring(i.KeySystem.Key)==tostring(A)
end

if B then
m:Close()()

if i.KeySystem.SaveKey then
local C=i.Folder or i.Title
writefile(C.."/"..j..".key",tostring(A))
end

task.wait(.4)
k(true)
end
end,"Primary",x)

A.AnchorPoint=Vector2.new(1,0.5)
A.Position=UDim2.new(1,0,0.5,0)










m:Open()
end

return b end function a.h()
local b=a.load'a'
local d=b.New
local e=b.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=16,
UIPadding=14,
ButtonPadding=9,
Holder=nil,
NotificationIndex=0,
Notifications={}
}

function f.Init(g)
local h={
Lower=false
}

function h.SetLower(i)
h.Lower=i
h.Frame.Size=i and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
IconThemed=g.IconThemed,
Background=g.Background,
BackgroundImageTransparency=g.BackgroundImageTransparency,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=true,
UIElements={},
Closed=false,
}
if h.CanClose==nil then
h.CanClose=true
end
f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h

local i=d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
})

local j=d("UIStroke",{
ThemeTag={
Color="Text"
},
Transparency=1,
Thickness=.6,
})

local k

if h.Icon then





















k=b.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.Window,
"Notification",
h.IconThemed
)
k.Size=UDim2.new(0,26,0,26)
k.Position=UDim2.new(0,f.UIPadding,0,f.UIPadding)

end

local l
if h.CanClose then
l=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
}
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local m=d("Frame",{
Size=UDim2.new(1,0,0,3),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text",
},

})

local n=d("Frame",{
Size=UDim2.new(1,
h.Icon and-28-f.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=16,
ThemeTag={
TextColor3="Text"
},
Text=h.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold)
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3)
})
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=15,
ThemeTag={
TextColor3="Text"
},
Text=h.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=n
})
end


local o=d("CanvasGroup",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
BackgroundTransparency=.25,
ThemeTag={
BackgroundColor3="Accent"
},

},{
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency

}),

j,i,
n,
k,l,
m,

})

local p=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder
},{
o
})

function h.Close(q)
if not h.Closed then
h.Closed=true
e(p,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(o,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
p:Destroy()
end
end

task.spawn(function()
task.wait()
e(p,0.45,{Size=UDim2.new(
1,
0,
0,
o.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(o,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
e(m,h.Duration,{Size=UDim2.new(0,0,0,3)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(h.Duration)
h:Close()
end
end)

if l then
b.AddSignal(l.TextButton.MouseButton1Click,function()
h:Close()
end)
end


return h
end

return f end function a.i()
local b={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function b.new(g)
local h={
Title=g.Title or"Dialog",
Content=g.Content,
Icon=g.Icon,
IconThemed=g.IconThemed,
Thumbnail=g.Thumbnail,
Buttons=g.Buttons
}

local i=a.load'f'.Init(nil,g.WindUI.ScreenGui.Popups)
local j=i.Create(true)

local k=200

local l=430
if h.Thumbnail and h.Thumbnail.Image then
l=430+(k/2)
end

j.UIElements.Main.AutomaticSize="Y"
j.UIElements.Main.Size=UDim2.new(0,l,0,0)



local m

if h.Icon then
m=d.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.WindUI.Window,
"Popup",
g.IconThemed
)
m.Size=UDim2.new(0,22,0,22)
m.LayoutOrder=-1
end


local n=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=h.Title,
TextXAlignment="Left",
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})

local o=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
m,n
})

local p=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





o,
})

local q
if h.Content and h.Content~=""then
q=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=h.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local r=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local s
if h.Thumbnail and h.Thumbnail.Image then
local t
if h.Thumbnail.Title then
t=e("TextLabel",{
Text=h.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
s=e("ImageLabel",{
Image=h.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,k,1,0),
Parent=j.UIElements.Main,
ScaleType="Crop"
},{
t,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,s and-k or 0,1,0),
Position=UDim2.new(0,s and k or 0,0,0),
BackgroundTransparency=1,
Parent=j.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
p,
q,
r,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local t=a.load'd'.New

for u,v in next,h.Buttons do
t(v.Title,v.Icon,v.Callback,v.Variant,r,j)
end

j:Open()


return h
end

return b end function a.j()
local b={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function b.New(g,h,i)
local j=10
local k
if h and h~=""then
k=e("ImageLabel",{
Image=d.Icon(h)[1],
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local l=e("TextLabel",{
BackgroundTransparency=1,
TextSize=16,
FontFace=Font.new(d.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,k and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=g,
})

local m=e("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=i,
BackgroundTransparency=1,
Text="",
},{
e("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
d.NewRoundFrame(j,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
d.NewRoundFrame(j,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
d.NewRoundFrame(j,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
e("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
e("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
k,
l,
})
})
})

return m
end


return b end function a.k()
local b={}

local d=game:GetService"UserInputService"

local e=a.load'a'
local f=e.New local g=
e.Tween


function b.New(h,i,j,k)
local l=f("Frame",{
Size=UDim2.new(0,k,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=i,
ZIndex=999,
Active=true,
})

local m=e.NewRoundFrame(k/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=l,
})

local n=f("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=m,
})

local o=false
local p=0

local function updateSliderSize()
local q=h
local r=q.AbsoluteCanvasSize.Y
local s=q.AbsoluteWindowSize.Y

if r<=s then
m.Visible=false
return
end

local t=math.clamp(s/r,0.1,1)
m.Size=UDim2.new(1,0,t,0)
m.Visible=true
end

local function updateScrollingFramePosition()
local q=m.Position.Y.Scale
local r=h.AbsoluteCanvasSize.Y
local s=h.AbsoluteWindowSize.Y
local t=math.max(r-s,0)

if t<=0 then return end

local u=math.max(1-m.Size.Y.Scale,0)
if u<=0 then return end

local v=q/u

h.CanvasPosition=Vector2.new(
h.CanvasPosition.X,
v*t
)
end

local function updateThumbPosition()
if o then return end

local q=h.CanvasPosition.Y
local r=h.AbsoluteCanvasSize.Y
local s=h.AbsoluteWindowSize.Y
local t=math.max(r-s,0)

if t<=0 then
m.Position=UDim2.new(0,0,0,0)
return
end

local u=q/t
local v=math.max(1-m.Size.Y.Scale,0)
local w=math.clamp(u*v,0,v)

m.Position=UDim2.new(0,0,w,0)
end

e.AddSignal(l.InputBegan,function(q)
if(q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==Enum.UserInputType.Touch)then
local r=m.AbsolutePosition.Y
local s=r+m.AbsoluteSize.Y

if not(q.Position.Y>=r and q.Position.Y<=s)then
local t=l.AbsolutePosition.Y
local u=l.AbsoluteSize.Y
local v=m.AbsoluteSize.Y

local w=q.Position.Y-t-v/2
local x=u-v

local y=math.clamp(w/x,0,1-m.Size.Y.Scale)

m.Position=UDim2.new(0,0,y,0)
updateScrollingFramePosition()
end
end
end)

e.AddSignal(n.InputBegan,function(q)
if q.UserInputType==Enum.UserInputType.MouseButton1 or q.UserInputType==Enum.UserInputType.Touch then
o=true
p=q.Position.Y-m.AbsolutePosition.Y

local r
local s

r=d.InputChanged:Connect(function(t)
if t.UserInputType==Enum.UserInputType.MouseMovement or t.UserInputType==Enum.UserInputType.Touch then
local u=l.AbsolutePosition.Y
local v=l.AbsoluteSize.Y
local w=m.AbsoluteSize.Y

local x=t.Position.Y-u-p
local y=v-w

local z=math.clamp(x/y,0,1-m.Size.Y.Scale)

m.Position=UDim2.new(0,0,z,0)
updateScrollingFramePosition()
end
end)

s=d.InputEnded:Connect(function(t)
if t.UserInputType==Enum.UserInputType.MouseButton1 or t.UserInputType==Enum.UserInputType.Touch then
o=false
if r then r:Disconnect()end
if s then s:Disconnect()end
end
end)
end
end)

e.AddSignal(h:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

e.AddSignal(h:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

e.AddSignal(h:GetPropertyChangedSignal"CanvasPosition",function()
if not o then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return l
end


return b end function a.l()

local b=game:GetService"HttpService"
local d=a.load'c'

local e
e={
Window=nil,
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(f)
return{
__type=f.__type,
value=f.Default:ToHex(),
transparency=f.Transparency or nil,
}
end,
Load=function(f,g)
if f then
f:Update(Color3.fromHex(g.value),g.transparency or nil)
end
end
},
Dropdown={
Save=function(f)
return{
__type=f.__type,
value=f.Value,
}
end,
Load=function(f,g)
if f then
f:Select(g.value)
end
end
},
Input={
Save=function(f)
return{
__type=f.__type,
value=f.Value,
}
end,
Load=function(f,g)
if f then
f:Set(g.value)
end
end
},
Keybind={
Save=function(f)
return{
__type=f.__type,
value=f.Value,
}
end,
Load=function(f,g)
if f then
f:Set(g.value)
end
end
},
Slider={
Save=function(f)
return{
__type=f.__type,
value=f.Value.Default,
}
end,
Load=function(f,g)
if f then
f:Set(g.value)
end
end
},
Toggle={
Save=function(f)
return{
__type=f.__type,
value=f.Value,
}
end,
Load=function(f,g)
if f then
f:Set(g.value)
end
end
},
Paragraph={
Save=function(f)
return{
__type=f.__type,
title=f.Title,
desc=f.Desc,
}
end,
Load=function(f,g)
if f then
if g.title then
f:SetTitle(g.title)
end
if g.desc then
f:SetDesc(g.desc)
end
end
end
},
}
}

function e.Init(f,g)
if not g.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."

return false
end

e.Window=g
e.Folder=g.Folder
e.Path="WindUI/"..tostring(e.Folder).."/config/"

return e
end

function e.CreateConfig(f,g)
local h={
Path=e.Path..g..".json",

Elements={}
}

if not g then
return false,"No config file is selected"
end

function h.Register(i,j,k)
h.Elements[j]=k
end

function h.Save(i)
local j={
Elements={},
Flags=d:GetAllFlags()
}

for k,l in next,h.Elements do
if e.Parser[l.__type]then
j.Elements[tostring(k)]=e.Parser[l.__type].Save(l)
end
end

print(b:JSONEncode(j))

writefile(h.Path,b:JSONEncode(j))
end

function h.Load(i)
if not isfile(h.Path)then return false,"Invalid file"end

local j=b:JSONDecode(readfile(h.Path))


for k,l in next,j.Elements do
if h.Elements[k]and e.Parser[l.__type]then
task.spawn(function()
e.Parser[l.__type].Load(h.Elements[k],l)
end)
end
end


if j.Flags then
for k,l in pairs(j.Flags)do
d:SetFlag(k,l)
end
end

end


e.Configs[g]=h

return h
end

function e.AllConfigs(f)
if listfiles then
local g={}
for h,i in next,listfiles(e.Path)do
local j=i:match"([^\\/]+)%.json$"
if j then
table.insert(g,j)
end
end

return g
end
return false
end

return e end function a.m()
local b={}

local d=a.load'a'
local e=d.New
local f=d.Tween

local g=game:GetService"UserInputService"


function b.New(h)
local i={
Button=nil
}

local j













local k=e("TextLabel",{
Text=h.Title,
TextSize=17,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local l=e("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
e("ImageLabel",{
Image=d.Icon"move"[1],
ImageRectOffset=d.Icon"move"[2].ImageRectPosition,
ImageRectSize=d.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
local m=e("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local n=e("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=h.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
local o=e("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=n,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



e("UICorner",{
CornerRadius=UDim.new(1,0)
}),
e("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
e("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
l,
m,

e("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

e("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
e("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
j,
e("UIListLayout",{
Padding=UDim.new(0,h.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
k,
e("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
e("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

i.Button=o



function i.SetIcon(p,q)
if j then
j:Destroy()
end
if q then
j=d.Image(
q,
h.Title,
0,
h.Folder,
"OpenButton",
true,
h.IconThemed
)
j.Size=UDim2.new(0,22,0,22)
j.LayoutOrder=-1
j.Parent=i.Button.TextButton
end
end

if h.Icon then
i:SetIcon(h.Icon)
end



d.AddSignal(o:GetPropertyChangedSignal"AbsoluteSize",function()
n.Size=UDim2.new(
0,o.AbsoluteSize.X,
0,o.AbsoluteSize.Y
)
end)

d.AddSignal(o.TextButton.MouseEnter,function()
f(o.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
d.AddSignal(o.TextButton.MouseLeave,function()
f(o.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local p=d.Drag(n)


function i.Visible(q,r)
n.Visible=r
end

function i.Edit(q,r)
local s={
Title=r.Title,
Icon=r.Icon,
Enabled=r.Enabled,
Position=r.Position,
Draggable=r.Draggable,
OnlyMobile=r.OnlyMobile,
CornerRadius=r.CornerRadius or UDim.new(1,0),
StrokeThickness=r.StrokeThickness or 2,
Color=r.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if s.Enabled==false then
h.IsOpenButtonEnabled=false
end
if s.Draggable==false and l and m then
l.Visible=s.Draggable
m.Visible=s.Draggable

if p then
p:Set(s.Draggable)
end
end
if s.Position and OpenButtonContainer then
OpenButtonContainer.Position=s.Position

end

local t=g.KeyboardEnabled or not g.TouchEnabled
b.Visible=not s.OnlyMobile or not t

if not b.Visible then return end

if k then
if s.Title then
k.Text=s.Title
elseif s.Title==nil then

end
end

if s.Icon then
i:SetIcon(s.Icon)
end

o.UIStroke.UIGradient.Color=s.Color
if Glow then
Glow.UIGradient.Color=s.Color
end

o.UICorner.CornerRadius=s.CornerRadius
o.TextButton.UICorner.CornerRadius=UDim.new(s.CornerRadius.Scale,s.CornerRadius.Offset-4)
o.UIStroke.Thickness=s.StrokeThickness
end

return i
end



return b end function a.n()
local b={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function b.New(g,h)
local i={
Container=nil,
ToolTipSize=16,
}

local j=e("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
Text=g,
TextSize=17,
ThemeTag={
TextColor3="Text",
}
})

local k=e("UIScale",{
Scale=.9
})

local l=e("CanvasGroup",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=h,
GroupTransparency=1,
Visible=false
},{
e("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
e("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
e("ImageLabel",{
Size=UDim2.new(0,i.ToolTipSize,0,i.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Accent",
},
},{
e("ImageLabel",{
Size=UDim2.new(0,i.ToolTipSize,0,i.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
e("Frame",{
AutomaticSize="XY",
ThemeTag={
BackgroundColor3="Accent",
},

},{
e("UICorner",{
CornerRadius=UDim.new(0,16),
}),
e("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=.9,
},{
e("UICorner",{
CornerRadius=UDim.new(0,16),
}),
e("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

j,
e("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
k,
e("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
i.Container=l

function i.Open(m)
l.Visible=true

f(l,.16,{GroupTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(k,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function i.Close(m)
f(l,.2,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(k,.2,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.25)

l.Visible=false
l:Destroy()
end

return i
end


return b end function a.o()
local b=a.load'a'
local d=b.New
local e=b.NewRoundFrame
local f=b.Tween

game:GetService"UserInputService"


return function(g)
local h={
Title=g.Title,
Desc=g.Desc or nil,
Hover=g.Hover,
Thumbnail=g.Thumbnail,
ThumbnailSize=g.ThumbnailSize or 80,
Image=g.Image,
IconThemed=g.IconThemed or false,
ImageSize=g.ImageSize or 30,
Color=g.Color,
Scalable=g.Scalable,
Parent=g.Parent,
UIPadding=14,
UICorner=14,
UIElements={}
}

local i=h.ImageSize
local j=h.ThumbnailSize
local k=true


local l=0

local m
local n
if h.Thumbnail then
m=b.Image(
h.Thumbnail,
h.Title,
h.UICorner-3,
g.Window.Folder,
"Thumbnail",
false,
h.IconThemed
)
m.Size=UDim2.new(1,0,0,j)
end
if h.Image then
n=b.Image(
h.Image,
h.Title,
h.UICorner-3,
g.Window.Folder,
"Image",
h.Color and true or false
)
if h.Color=="White"then
n.ImageLabel.ImageColor3=Color3.new(0,0,0)
elseif h.Color then
n.ImageLabel.ImageColor3=Color3.new(1,1,1)
end
n.Size=UDim2.new(0,i,0,i)

l=i
end

local function CreateText(o,p)
return d("TextLabel",{
BackgroundTransparency=1,
Text=o or"",
TextSize=p=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not h.Color and(p=="Desc"and"Icon"or"Text")or nil,
},
TextColor3=h.Color and(h.Color=="White"and Color3.new(0,0,0)or h.Color~="White"and Color3.new(1,1,1))or nil,
TextTransparency=h.Color and(p=="Desc"and.3 or 0),
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(b.Font,Enum.FontWeight.Medium)
})
end

local o=CreateText(h.Title,"Title")
local p=CreateText(h.Desc,"Desc")
if not h.Desc or h.Desc==""then
p.Visible=false
end

h.UIElements.Container=d("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
d("UIListLayout",{
Padding=UDim.new(0,h.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
m,
d("Frame",{
Size=UDim2.new(1,-g.TextOffset,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
d("UIListLayout",{
Padding=UDim.new(0,h.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
n,
d("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,-l,0,(50-(h.UIPadding*2)))
},{
d("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
o,
p
}),
})
})

h.UIElements.Locked=e(h.UICorner,"Squircle",{
Size=UDim2.new(1,h.UIPadding*2,1,h.UIPadding*2),
ImageTransparency=.4,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
ZIndex=9999999,
})

h.UIElements.Main=e(h.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,50),
AutomaticSize="Y",
ImageTransparency=h.Color and.1 or.95,



Parent=g.Parent,
ThemeTag={
ImageColor3=not h.Color and"Text"or nil
},
ImageColor3=h.Color and Color3.fromHex(b.Colors[h.Color])or nil
},{
h.UIElements.Container,
h.UIElements.Locked,
d("UIPadding",{
PaddingTop=UDim.new(0,h.UIPadding),
PaddingLeft=UDim.new(0,h.UIPadding),
PaddingRight=UDim.new(0,h.UIPadding),
PaddingBottom=UDim.new(0,h.UIPadding),
}),
},true)

if h.Hover then
b.AddSignal(h.UIElements.Main.MouseEnter,function()
if k then
f(h.UIElements.Main,.05,{ImageTransparency=h.Color and.15 or.9}):Play()
end
end)
b.AddSignal(h.UIElements.Main.InputEnded,function()
if k then
f(h.UIElements.Main,.05,{ImageTransparency=h.Color and.1 or.95}):Play()
end
end)
end

function h.SetTitle(q,r)
o.Text=r
end

function h.SetDesc(q,r)
p.Text=r or""
if not r then
p.Visible=false
elseif not p.Visible then
p.Visible=true
end
end






function h.Destroy(q)
h.UIElements.Main:Destroy()
end


function h.Lock(q)
k=false
h.UIElements.Locked.Active=true
h.UIElements.Locked.Visible=true
end

function h.Unlock(q)
k=true
h.UIElements.Locked.Active=false
h.UIElements.Locked.Visible=false
end





return h
end end function a.p()
local b=a.load'a'
local d=a.load'c'
local e=b.New

local f={}

function f.New(g,h)
local i={
__type="Button",
Title=h.Title or"Button",
Desc=h.Desc or nil,
Locked=h.Locked or false,
Flags=h.Flags or nil,
Callback=h.Callback or function()end,
UIElements={}
}

local j=true

i.ButtonFrame=a.load'o'{
Title=i.Title,
Desc=i.Desc,
Parent=h.Parent,




Window=h.Window,
TextOffset=20,
Hover=true,
Scalable=true,
}

i.UIElements.ButtonIcon=e("ImageLabel",{
Image=b.Icon"mouse-pointer-click"[1],
ImageRectOffset=b.Icon"mouse-pointer-click"[2].ImageRectPosition,
ImageRectSize=b.Icon"mouse-pointer-click"[2].ImageRectSize,
BackgroundTransparency=1,
Parent=i.ButtonFrame.UIElements.Main,
Size=UDim2.new(0,20,0,20),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ThemeTag={
ImageColor3="Text"
}
})

function i.Lock(k)
j=false
return i.ButtonFrame:Lock()
end
function i.Unlock(k)
j=true
return i.ButtonFrame:Unlock()
end

if i.Locked then
i:Lock()
end

b.AddSignal(i.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if j then
task.spawn(function()
b.SafeCallback(i.Callback)


if i.Flags then
d.Values[i.Flags]=true
end
end)
end
end)


if i.Flags then
d:Register(i.Flags,i)
end

return i.__type,i
end

return f end function a.q()
local b={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function b.New(g,h,i,j)
local k={}


local l=13
local m
if h and h~=""then
m=e("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=d.Icon(h)[1],
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local n=d.NewRoundFrame(l,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=i,
Size=UDim2.new(0,42,0,26),
},{
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
d.NewRoundFrame(l,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
e("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),
Name="Frame",
},{
m,
})
})

function k.Set(o,p)
if p then
f(n.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(n.Layer,0.1,{
ImageTransparency=0,
}):Play()
f(n.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if m then
f(m,0.1,{
ImageTransparency=0,
}):Play()
end
else
f(n.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
f(n.Layer,0.1,{
ImageTransparency=1,
}):Play()
f(n.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if m then
f(m,0.1,{
ImageTransparency=1,
}):Play()
end
end

task.spawn(function()
if j then
d.SafeCallback(j,p)
end
end)


end

return n,k
end


return b end function a.r()
local b={}

local d=a.load'a'
local e=d.New
local f=d.Tween


function b.New(g,h,i,j)
local k={}

h=h or"check"

local l=10
local m=e("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=d.Icon(h)[1],
ImageRectOffset=d.Icon(h)[2].ImageRectPosition,
ImageRectSize=d.Icon(h)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local n=d.NewRoundFrame(l,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=i,
Size=UDim2.new(0,27,0,27),
},{
d.NewRoundFrame(l,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
d.NewRoundFrame(l,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
e("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

m,
})

function k.Set(o,p)
if p then
f(n.Layer,0.06,{
ImageTransparency=0,
}):Play()
f(n.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
f(m,0.06,{
ImageTransparency=0,
}):Play()
else
f(n.Layer,0.05,{
ImageTransparency=1,
}):Play()
f(n.Stroke,0.05,{
ImageTransparency=1,
}):Play()
f(m,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if j then
d.SafeCallback(j,p)
end
end)
end

return n,k
end


return b end function a.s()
local b=a.load'a'
local d=a.load'c'local e=
b.New local f=
b.Tween

local g=a.load'q'.New
local h=a.load'r'.New

local i={}

function i.New(j,k)
local l={
__type="Toggle",
Title=k.Title or"Toggle",
Desc=k.Desc or nil,
Value=k.Value,
Icon=k.Icon or nil,
Type=k.Type or"Toggle",
Flags=k.Flags or nil,
Callback=k.Callback or function()end,
UIElements={}
}
l.ToggleFrame=a.load'o'{
Title=l.Title,
Desc=l.Desc,




Window=k.Window,
Parent=k.Parent,
TextOffset=44,
Hover=false,
}

local m=true

if l.Value==nil then
l.Value=false
end



function l.Lock(n)
m=false
return l.ToggleFrame:Lock()
end
function l.Unlock(n)
m=true
return l.ToggleFrame:Unlock()
end

if l.Locked then
l:Lock()
end

local n=l.Value

local o,p
if l.Type=="Toggle"then
o,p=g(n,l.Icon,l.ToggleFrame.UIElements.Main,l.Callback)
elseif l.Type=="Checkbox"then
o,p=h(n,l.Icon,l.ToggleFrame.UIElements.Main,l.Callback)
else
error("Unknown Toggle Type: "..tostring(l.Type))
end

o.AnchorPoint=Vector2.new(1,0.5)
o.Position=UDim2.new(1,0,0.5,0)

function l.Set(q,r)
if m then
p:Set(r)
n=r
l.Value=r


if l.Flags then
d.Values[l.Flags]=r
end
end
end

l:Set(n)

b.AddSignal(l.ToggleFrame.UIElements.Main.MouseButton1Click,function()
l:Set(not n)
end)


if l.Flags then
d:Register(l.Flags,l)
end

return l.__type,l
end

return i end function a.t()
local b=a.load'a'
local d=a.load'c'
local f=b.New
local g=b.Tween

local h={}

local i=false

function h.New(j,k)
local l={
__type="Slider",
Title=k.Title or"Slider",
Desc=k.Desc or nil,
Locked=k.Locked or nil,
Value=k.Value or{},
Step=k.Step or 1,
Flags=k.Flags or nil,
Callback=k.Callback or function()end,
UIElements={},
IsFocusing=false,
}
local m
local n
local o
local p=l.Value.Default or l.Value.Min or 0

local q=p
local r=(p-(l.Value.Min or 0))/((l.Value.Max or 100)-(l.Value.Min or 0))

local s=true
local t=l.Step%1~=0

local function FormatValue(u)
if t then
return string.format("%.2f",u)
else
return tostring(math.floor(u+0.5))
end
end

local function CalculateValue(u)
if t then
return math.floor(u/l.Step+0.5)*l.Step
else
return math.floor(u/l.Step+0.5)*l.Step
end
end

l.SliderFrame=a.load'o'{
Title=l.Title,
Desc=l.Desc,
Parent=k.Parent,
TextOffset=0,
Hover=false,
}

l.UIElements.SliderIcon=b.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,-68,0,4),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
b.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(r,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
b.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

l.UIElements.SliderContainer=f("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Parent=l.SliderFrame.UIElements.Container,
},{
f("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
l.UIElements.SliderIcon,
f("TextBox",{
Size=UDim2.new(0,60,0,0),
TextXAlignment="Left",
Text=FormatValue(p),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function l.Lock(u)
s=false
return l.SliderFrame:Lock()
end
function l.Unlock(u)
s=true
return l.SliderFrame:Unlock()
end

if l.Locked then
l:Lock()
end

function l.Set(u,v,w)
if s then
if not l.IsFocusing and not i and(not w or(w.UserInputType==Enum.UserInputType.MouseButton1 or w.UserInputType==Enum.UserInputType.Touch))then
v=math.clamp(v,l.Value.Min or 0,l.Value.Max or 100)

local x=math.clamp((v-(l.Value.Min or 0))/((l.Value.Max or 100)-(l.Value.Min or 0)),0,1)
v=CalculateValue(l.Value.Min+x*(l.Value.Max-l.Value.Min))

if v~=q then
g(l.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(x,0,1,0)}):Play()
l.UIElements.SliderContainer.TextBox.Text=FormatValue(v)
l.Value.Default=FormatValue(v)
q=v
b.SafeCallback(l.Callback,FormatValue(v))


if l.Flags then
d.Values[l.Flags]=FormatValue(v)
end
end

if w then
m=(w.UserInputType==Enum.UserInputType.Touch)
l.SliderFrame.Parent.ScrollingEnabled=false
i=true
n=game:GetService"RunService".RenderStepped:Connect(function()
local y=m and w.Position.X or game:GetService"UserInputService":GetMouseLocation().X
local z=math.clamp((y-l.UIElements.SliderIcon.AbsolutePosition.X)/l.UIElements.SliderIcon.AbsoluteSize.X,0,1)
v=CalculateValue(l.Value.Min+z*(l.Value.Max-l.Value.Min))

if v~=q then
g(l.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(z,0,1,0)}):Play()
l.UIElements.SliderContainer.TextBox.Text=FormatValue(v)
l.Value.Default=FormatValue(v)
q=v
b.SafeCallback(l.Callback,FormatValue(v))
end
end)
o=game:GetService"UserInputService".InputEnded:Connect(function(y)
if(y.UserInputType==Enum.UserInputType.MouseButton1 or y.UserInputType==Enum.UserInputType.Touch)and w==y then
n:Disconnect()
o:Disconnect()
i=false
l.SliderFrame.Parent.ScrollingEnabled=true
end
end)
end
end
end
end

b.AddSignal(l.UIElements.SliderContainer.TextBox.FocusLost,function(u)
if u then
local v=tonumber(l.UIElements.SliderContainer.TextBox.Text)
if v then
l:Set(v)
else
l.UIElements.SliderContainer.TextBox.Text=FormatValue(q)
end
end
end)

b.AddSignal(l.UIElements.SliderContainer.InputBegan,function(u)
l:Set(p,u)
end)


if l.Flags then
d:Register(l.Flags,l)
end

return l.__type,l
end

return h end function a.u()
local b=game:GetService"UserInputService"

local d=a.load'a'
local f=a.load'c'
local g=d.New local h=
d.Tween

local i={
UICorner=6,
UIPadding=8,
}

local j=a.load'j'.New

function i.New(k,l)
local m={
__type="Keybind",
Title=l.Title or"Keybind",
Desc=l.Desc or nil,
Locked=l.Locked or false,
Value=l.Value or"F",
Flags=l.Flags or nil,
Callback=l.Callback or function()end,
CanChange=l.CanChange or true,
Picking=false,
UIElements={},
}

local n=true

m.KeybindFrame=a.load'o'{
Title=m.Title,
Desc=m.Desc,
Parent=l.Parent,
TextOffset=85,
Hover=m.CanChange,
}

m.UIElements.Keybind=j(m.Value,nil,m.KeybindFrame.UIElements.Main)

m.UIElements.Keybind.Size=UDim2.new(
0,24
+m.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
m.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
m.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

g("UIScale",{
Parent=m.UIElements.Keybind,
Scale=.85,
})

d.AddSignal(m.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
m.UIElements.Keybind.Size=UDim2.new(
0,24
+m.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function m.Lock(o)
n=false
return m.KeybindFrame:Lock()
end
function m.Unlock(o)
n=true
return m.KeybindFrame:Unlock()
end

function m.Set(o,p)
m.Value=p
m.UIElements.Keybind.Frame.Frame.TextLabel.Text=p


if m.Flags then
f.Values[m.Flags]=p
end
end

if m.Locked then
m:Lock()
end

d.AddSignal(m.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if n then
if m.CanChange then
m.Picking=true
m.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local o
o=b.InputBegan:Connect(function(p)
local q

if p.UserInputType==Enum.UserInputType.Keyboard then
q=p.KeyCode.Name
elseif p.UserInputType==Enum.UserInputType.MouseButton1 then
q="MouseLeft"
elseif p.UserInputType==Enum.UserInputType.MouseButton2 then
q="MouseRight"
end

local r
r=b.InputEnded:Connect(function(s)
if s.KeyCode.Name==q or q=="MouseLeft"and s.UserInputType==Enum.UserInputType.MouseButton1 or q=="MouseRight"and s.UserInputType==Enum.UserInputType.MouseButton2 then
m.Picking=false

m.UIElements.Keybind.Frame.Frame.TextLabel.Text=q
m.Value=q

o:Disconnect()
r:Disconnect()
end
end)
end)
end
end
end)
d.AddSignal(b.InputBegan,function(o)
if n then
if o.KeyCode.Name==m.Value then
d.SafeCallback(m.Callback,o.KeyCode.Name)
end
end
end)


if m.Flags then
f:Register(m.Flags,m)
end

return m.__type,m
end

return i end function a.v()
local b=a.load'a'
local d=a.load'c'
local f=b.New local g=
b.Tween

local h={
UICorner=8,
UIPadding=8,
}local i=a.load'd'


.New
local j=a.load'e'.New

function h.New(k,l)
local m={
__type="Input",
Title=l.Title or"Input",
Desc=l.Desc or nil,
Type=l.Type or"Input",
Locked=l.Locked or false,
InputIcon=l.InputIcon or false,
Placeholder=l.Placeholder or"Enter Text...",
Value=l.Value or"",
Flags=l.Flags or nil,
Callback=l.Callback or function()end,
ClearTextOnFocus=l.ClearTextOnFocus or false,
UIElements={},
}

local n=true

m.InputFrame=a.load'o'{
Title=m.Title,
Desc=m.Desc,
Parent=l.Parent,
TextOffset=0,
Hover=false,
}

local o=j(m.Placeholder,m.InputIcon,m.InputFrame.UIElements.Container,m.Type,function(o)
m:Set(o)
end)
o.Size=UDim2.new(1,0,0,m.Type=="Input"and 42 or 148)

f("UIScale",{
Parent=o,
Scale=1,
})

function m.Lock(p)
n=false
return m.InputFrame:Lock()
end
function m.Unlock(p)
n=true
return m.InputFrame:Unlock()
end


function m.Set(p,q)
if n then
b.SafeCallback(m.Callback,q)

o.Frame.Frame.TextBox.Text=q
m.Value=q


if m.Flags then
d.Values[m.Flags]=q
end
end
end
function m.SetPlaceholder(p,q)
o.Frame.Frame.TextBox.PlaceholderText=q
m.Placeholder=q
end

m:Set(m.Value)

if m.Locked then
m:Lock()
end


if m.Flags then
d:Register(m.Flags,m)
end

return m.__type,m
end

return h end function a.w()
local b=game:GetService"UserInputService"
local d=game:GetService"Players".LocalPlayer:GetMouse()
local f=game:GetService"Workspace".CurrentCamera

local h=a.load'a'
local i=a.load'c'
local j=h.New
local k=h.Tween

local l=a.load'j'.New

local m={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
}

function m.New(n,o)
local p={
__type="Dropdown",
Title=o.Title or"Dropdown",
Desc=o.Desc or nil,
Locked=o.Locked or false,
Values=o.Values or{},
MenuWidth=o.MenuWidth or 170,
Value=o.Value,
AllowNone=o.AllowNone,
Multi=o.Multi,
Flags=o.Flags or nil,
Callback=o.Callback or function()end,

UIElements={},

Opened=false,
Tabs={}
}

if p.Multi and not p.Value then
p.Value={}
end

local q=true

p.DropdownFrame=a.load'o'{
Title=p.Title,
Desc=p.Desc,
Parent=o.Parent,
TextOffset=0,
Hover=false,
}


p.UIElements.Dropdown=l("",nil,p.DropdownFrame.UIElements.Container)

p.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
p.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,p.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

p.UIElements.Dropdown.Size=UDim2.new(1,0,0,40)






j("ImageLabel",{
Image=h.Icon"chevrons-up-down"[1],
ImageRectOffset=h.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=h.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=p.UIElements.Dropdown.Frame
})

p.UIElements.UIListLayout=j("UIListLayout",{
Padding=UDim.new(0,m.MenuPadding),
FillDirection="Vertical"
})

p.UIElements.Menu=h.NewRoundFrame(m.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=0.05,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
j("UIPadding",{
PaddingTop=UDim.new(0,m.MenuPadding),
PaddingLeft=UDim.new(0,m.MenuPadding),
PaddingRight=UDim.new(0,m.MenuPadding),
PaddingBottom=UDim.new(0,m.MenuPadding),
}),
j("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),

ClipsDescendants=true
},{
j("UICorner",{
CornerRadius=UDim.new(0,m.MenuCorner-m.MenuPadding),
}),
j("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
p.UIElements.UIListLayout,
})
})
})

p.UIElements.MenuCanvas=j("Frame",{
Size=UDim2.new(0,p.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=o.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
p.UIElements.Menu,






j("UISizeConstraint",{
MinSize=Vector2.new(170,0)
})
})

function p.Lock(r)
q=false
return p.DropdownFrame:Lock()
end
function p.Unlock(r)
q=true
return p.DropdownFrame:Unlock()
end

if p.Locked then
p:Lock()
end

local function RecalculateCanvasSize()
p.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,p.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
if#p.Values>10 then
p.UIElements.MenuCanvas.Size=UDim2.fromOffset(p.UIElements.MenuCanvas.AbsoluteSize.X,392)
else
p.UIElements.MenuCanvas.Size=UDim2.fromOffset(p.UIElements.MenuCanvas.AbsoluteSize.X,p.UIElements.UIListLayout.AbsoluteContentSize.Y+(m.MenuPadding*2))
end
end

function UpdatePosition()
local r=p.UIElements.Dropdown
local s=p.UIElements.MenuCanvas

local t=f.ViewportSize.Y-(r.AbsolutePosition.Y+r.AbsoluteSize.Y)-m.MenuPadding-54
local u=s.AbsoluteSize.Y+m.MenuPadding

local v=-54
if t<u then
v=u-t-54
end

s.Position=UDim2.new(
0,
r.AbsolutePosition.X+r.AbsoluteSize.X,
0,
r.AbsolutePosition.Y+r.AbsoluteSize.Y-v+m.MenuPadding
)
end



function p.Display(r)
local s=p.Values
local t=""

if p.Multi then
for u,v in next,s do
if table.find(p.Value,v)then
t=t..v..", "
end
end
t=t:sub(1,#t-2)
else
t=p.Value or""
end

p.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(t==""and"--"or t)
end

function p.Refresh(r,s)
for t,u in next,p.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not u:IsA"UIListLayout"then
u:Destroy()
end
end

p.Tabs={}

for t,u in next,s do

local v={
Name=u,
Selected=false,
UIElements={},
}
v.UIElements.TabItem=h.NewRoundFrame(m.MenuCorner-m.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,34),

ImageTransparency=1,
Parent=p.UIElements.Menu.Frame.ScrollingFrame,

ImageColor3=Color3.new(1,1,1),

},{
h.NewRoundFrame(m.MenuCorner-m.MenuPadding,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
Name="Highlight",
},{
j("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
j("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
j("UIPadding",{

PaddingLeft=UDim.new(0,m.TabPadding),
PaddingRight=UDim.new(0,m.TabPadding),

}),
j("UICorner",{
CornerRadius=UDim.new(0,m.MenuCorner-m.MenuPadding)
}),













j("TextLabel",{
Text=u,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",

Size=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})
},true)


if p.Multi then
v.Selected=table.find(p.Value or{},v.Name)
else
v.Selected=p.Value==v.Name
end

if v.Selected then
v.UIElements.TabItem.ImageTransparency=.95
v.UIElements.TabItem.Highlight.ImageTransparency=.75


v.UIElements.TabItem.Frame.TextLabel.TextTransparency=0.05
end

p.Tabs[t]=v

p:Display()

local function Callback()
p:Display()
task.spawn(function()
h.SafeCallback(p.Callback,p.Value)
end)
end

h.AddSignal(v.UIElements.TabItem.MouseButton1Click,function()
if p.Multi then
if not v.Selected then
v.Selected=true
k(v.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
k(v.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

k(v.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0}):Play()
table.insert(p.Value,v.Name)
else
if not p.AllowNone and#p.Value==1 then
return
end
v.Selected=false
k(v.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
k(v.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

k(v.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.4}):Play()
for w,x in ipairs(p.Value)do
if x==v.Name then
table.remove(p.Value,w)
break
end
end
end
else
for w,x in next,p.Tabs do

k(x.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
k(x.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

k(x.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.5}):Play()
x.Selected=false
end
v.Selected=true
k(v.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
k(v.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

k(v.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0.05}):Play()
p.Value=v.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end

local t=0
for u,v in next,p.Tabs do
if v.UIElements.TabItem.Frame.TextLabel then

local w=v.UIElements.TabItem.Frame.TextLabel.TextBounds.X
t=math.max(t,w)
end
end

p.UIElements.MenuCanvas.Size=UDim2.new(0,t+6+6+5+5+18+6+6,p.UIElements.MenuCanvas.Size.Y.Scale,p.UIElements.MenuCanvas.Size.Y.Offset)

end


p:Refresh(p.Values)

function p.Select(r,s)
if s then
p.Value=s
else
if p.Multi then
p.Value={}
else
p.Value=nil

end
end
p:Refresh(p.Values)


if p.Flags then
i.Values[p.Flags]=p.Value
end
end


RecalculateListSize()

function p.Open(r)
if q then
p.UIElements.Menu.Visible=true
p.UIElements.MenuCanvas.Visible=true
p.UIElements.MenuCanvas.Active=true
p.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
k(p.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
p.Opened=true
end)




UpdatePosition()
end
end
function p.Close(r)
p.Opened=false

k(p.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()


task.spawn(function()
task.wait(.2)
p.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
p.UIElements.MenuCanvas.Visible=false
p.UIElements.MenuCanvas.Active=false
end)
end

h.AddSignal(p.UIElements.Dropdown.MouseButton1Click,function()
p:Open()
end)

h.AddSignal(b.InputBegan,function(r)
if
r.UserInputType==Enum.UserInputType.MouseButton1
or r.UserInputType==Enum.UserInputType.Touch
then
local s,t=p.UIElements.MenuCanvas.AbsolutePosition,p.UIElements.MenuCanvas.AbsoluteSize
if
o.Window.CanDropdown
and p.Opened
and(d.X<s.X
or d.X>s.X+t.X
or d.Y<(s.Y-20-1)
or d.Y>s.Y+t.Y
)
then
p:Close()
end
end
end)

h.AddSignal(p.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition",UpdatePosition)


if p.Flags then
i:Register(p.Flags,p)
end

return p.__type,p
end

return m end function a.x()






local b={}
local d={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local f={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(h)
local i={}
for j,k in ipairs(h)do
i[k]=true
end
return i
end

local h=createKeywordSet(d.lua)
local i=createKeywordSet(d.rbx)
local j=createKeywordSet(d.operators)

local function getHighlight(k,l)
local m=k[l]

if f[m.."_color"]then
return f[m.."_color"]
end

if tonumber(m)then
return f.numbers
elseif m=="nil"then
return f.null
elseif m:sub(1,2)=="--"then
return f.comment
elseif j[m]then
return f.operator
elseif h[m]then
return f.lua
elseif i[m]then
return f.rbx
elseif m:sub(1,1)=="\""or m:sub(1,1)=="\'"then
return f.str
elseif m=="true"or m=="false"then
return f.boolean
end

if k[l+1]=="("then
if k[l-1]==":"then
return f.self_call
end

return f.call
end

if k[l-1]=="."then
if k[l-2]=="Enum"then
return f.rbx
end

return f.local_property
end
end

function b.run(k)
local l={}
local m=""

local n=false
local o=false
local p=false

for q=1,#k do
local r=k:sub(q,q)

if o then
if r=="\n"and not p then
table.insert(l,m)
table.insert(l,r)
m=""

o=false
elseif k:sub(q-1,q)=="]]"and p then
m..="]"

table.insert(l,m)
m=""

o=false
p=false
else
m=m..r
end
elseif n then
if r==n and k:sub(q-1,q-1)~="\\"or r=="\n"then
m=m..r
n=false
else
m=m..r
end
else
if k:sub(q,q+1)=="--"then
table.insert(l,m)
m="-"
o=true
p=k:sub(q+2,q+3)=="[["
elseif r=="\""or r=="\'"then
table.insert(l,m)
m=r
n=r
elseif j[r]then
table.insert(l,m)
table.insert(l,r)
m=""
elseif r:match"[%w_]"then
m=m..r
else
table.insert(l,m)
table.insert(l,r)
m=""
end
end
end

table.insert(l,m)

local q={}

for r,s in ipairs(l)do
local t=getHighlight(l,r)

if t then
local u=string.format("<font color = \"#%s\">%s</font>",t:ToHex(),s:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(q,u)
else
table.insert(q,s)
end
end

return table.concat(q)
end

return b end function a.y()
local b={}

local d=a.load'a'
local f=d.New
local h=d.Tween

local i=a.load'x'

function b.New(j,k,l,m,n)
local o={
Radius=12,
Padding=10
}

local p=f("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
f("UIPadding",{
PaddingTop=UDim.new(0,o.Padding+3),
PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),
PaddingBottom=UDim.new(0,o.Padding+3),
})
})
p.Font="Code"

local q=f("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
p
})

local r=f("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-o.Padding/2,0,o.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=m and true or false,
},{
d.NewRoundFrame(o.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
f("UIScale",{
Scale=1,
}),
f("ImageLabel",{
Image=d.Icon"copy"[1],
ImageRectSize=d.Icon"copy"[2].ImageRectSize,
ImageRectOffset=d.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

d.AddSignal(r.MouseEnter,function()
h(r.Button,.05,{ImageTransparency=.95}):Play()
h(r.Button.UIScale,.05,{Scale=.9}):Play()
end)
d.AddSignal(r.InputEnded,function()
h(r.Button,.08,{ImageTransparency=1}):Play()
h(r.Button.UIScale,.08,{Scale=1}):Play()
end)

d.NewRoundFrame(o.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
AutomaticSize="Y",
Parent=l,
},{
d.NewRoundFrame(o.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
f("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
d.NewRoundFrame(o.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
Visible=k and true or false
},{
f("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
f("TextLabel",{
Text=k,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,r and-20-(o.Padding*2),0,0)
}),
f("UIPadding",{

PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),

}),
f("UIListLayout",{
Padding=UDim.new(0,o.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
q,
f("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
r,
})

d.AddSignal(p:GetPropertyChangedSignal"TextBounds",function()
q.Size=UDim2.new(1,0,0,(p.TextBounds.Y/(n or 1))+((o.Padding+3)*2))
end)

function o.Set(s)
p.Text=i.run(s)
end

o.Set(j)

d.AddSignal(r.MouseButton1Click,function()
if m then
m()
local s=d.Icon"check"
r.Button.ImageLabel.Image=s[1]
r.Button.ImageLabel.ImageRectSize=s[2].ImageRectSize
r.Button.ImageLabel.ImageRectOffset=s[2].ImageRectPosition
end
end)
return o
end


return b end function a.z()
local b=a.load'a'
local d=a.load'c'local f=
b.New


local h=a.load'y'

local i={}

function i.New(j,k)
local l={
__type="Code",
Title=k.Title,
Code=k.Code,
Flags=k.Flags or nil,
UIElements={}
}

local m=not l.Locked











local n=h.New(l.Code,l.Title,k.Parent,function()
if m then
local n=l.Title or"code"
local o,p=pcall(function()
toclipboard(l.Code)
end)
if o then
k.WindUI:Notify{
Title="Success",
Content="The "..n.." copied to your clipboard.",
Icon="check",
Duration=5,
}
else
k.WindUI:Notify{
Title="Error",
Content="The "..n.." is not copied. Error: "..p,
Icon="x",
Duration=5,
}
end
end
end,k.WindUI.UIScale)

function l.SetCode(o,p)
n.Set(p)
l.Code=p


if l.Flags then
d.Values[l.Flags]=p
end
end


if l.Flags then
d:Register(l.Flags,l)
end

return l.__type,l
end

return i end function a.A()
local b=a.load'a'
local d=a.load'c'
local f=b.New local h=
b.Tween

local i=game:GetService"UserInputService"
game:GetService"TouchInputService"
local j=game:GetService"RunService"
local k=game:GetService"Players"

local l=j.RenderStepped
local m=k.LocalPlayer
local n=m:GetMouse()

local o=a.load'd'.New
local p=a.load'e'.New

local q={
UICorner=8,
UIPadding=8
}

function q.Colorpicker(r,s,t)
local u={
__type="Colorpicker",
Title=s.Title,
Desc=s.Desc,
Default=s.Default,
Flags=s.Flags or nil,
Callback=s.Callback,
Transparency=s.Transparency,
UIElements=s.UIElements,
}

function u.SetHSVFromRGB(v,w)
local x,y,z=Color3.toHSV(w)
u.Hue=x
u.Sat=y
u.Vib=z
end

u:SetHSVFromRGB(u.Default)

local v=a.load'f'.Init(s.Window)
local w=v.Create()

u.ColorpickerFrame=w



local x,y,z=u.Hue,u.Sat,u.Vib

u.UIElements.Title=f("TextLabel",{
Text=u.Title,
TextSize=20,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=w.UIElements.Main
},{
f("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})
})





local A=f("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
})

u.UIElements.SatVibMap=f("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(x,1,1),
BackgroundTransparency=0,
Parent=w.UIElements.Main,
},{
f("UICorner",{
CornerRadius=UDim.new(0,8),
}),
f("UIStroke",{
Thickness=.6,
ThemeTag={
Color="Text"
},
Transparency=.8,
}),
A,
})

u.UIElements.Inputs=f("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(u.Transparency and 240 or 210,40),
BackgroundTransparency=1,
Parent=w.UIElements.Main
},{
f("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
})
})





local B=f("Frame",{
BackgroundColor3=u.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=u.Transparency,
},{
f("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

f("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208),
Size=UDim2.fromOffset(75,24),
Parent=w.UIElements.Main,
},{
f("UICorner",{
CornerRadius=UDim.new(0,8),
}),
f("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
B,
})

local C=f("Frame",{
BackgroundColor3=u.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
f("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

f("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208),
Size=UDim2.fromOffset(75,24),
Parent=w.UIElements.Main,
},{
f("UICorner",{
CornerRadius=UDim.new(0,8),
}),
f("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
C,
})

local D={}

for E=0,1,0.1 do
table.insert(D,ColorSequenceKeypoint.new(E,Color3.fromHSV(E,1,1)))
end

local E=f("UIGradient",{
Color=ColorSequence.new(D),
Rotation=90,
})

local F=f("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local G=f("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=F,


BackgroundColor3=u.Default
},{
f("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
f("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local H=f("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(180,40),
Parent=w.UIElements.Main,
},{
f("UICorner",{
CornerRadius=UDim.new(1,0),
}),
E,
F,
})


function CreateNewInput(I,J)
local K=p(I,nil,u.UIElements.Inputs)

f("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(b.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=K.Frame,
Text=I,
})

f("UIScale",{
Parent=K,
Scale=.85,
})

K.Frame.Frame.TextBox.Text=J
K.Size=UDim2.new(0,150,0,42)

return K
end

local function ToRGB(I)
return{
R=math.floor(I.R*255),
G=math.floor(I.G*255),
B=math.floor(I.B*255)
}
end

local I=CreateNewInput("Hex","#"..u.Default:ToHex())

local J=CreateNewInput("Red",ToRGB(u.Default).R)
local K=CreateNewInput("Green",ToRGB(u.Default).G)
local L=CreateNewInput("Blue",ToRGB(u.Default).B)
local M
if u.Transparency then
M=CreateNewInput("Alpha",((1-u.Transparency)*100).."%")
end

local N=f("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254),
BackgroundTransparency=1,
Parent=w.UIElements.Main,
LayoutOrder=4,
},{
f("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),
})

local O={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()t(Color3.fromHSV(u.Hue,u.Sat,u.Vib),u.Transparency)end
}
}

for P,Q in next,O do
local R=o(Q.Title,Q.Icon,Q.Callback,Q.Variant,N,w,true)
R.Size=UDim2.new(0.5,-3,0,40)
R.AutomaticSize="None"
end



local P,Q,R
if u.Transparency then
local S=f("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

Q=f("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=S,

},{
f("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
f("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

R=f("Frame",{
Size=UDim2.fromScale(1,1),
},{
f("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
f("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

P=f("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(210,40),
Parent=w.UIElements.Main,
BackgroundTransparency=1,
},{
f("UICorner",{
CornerRadius=UDim.new(1,0),
}),
f("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
f("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
R,
S,
})
end

function u.Round(S,T,U)
if U==0 then
return math.floor(T)
end
T=tostring(T)
return T:find"%."and tonumber(T:sub(1,T:find"%."+U))or T
end


function u.Update(S,T,U)
if T then x,y,z=Color3.toHSV(T)else x,y,z=u.Hue,u.Sat,u.Vib end

u.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(x,1,1)
A.Position=UDim2.new(y,0,1-z,0)
C.BackgroundColor3=Color3.fromHSV(x,y,z)
G.BackgroundColor3=Color3.fromHSV(x,1,1)
G.Position=UDim2.new(0.5,0,x,0)

I.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(x,y,z):ToHex()
J.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).R
K.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).G
L.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(x,y,z)).B

if U or u.Transparency then
C.BackgroundTransparency=u.Transparency or U
R.BackgroundColor3=Color3.fromHSV(x,y,z)
Q.BackgroundColor3=Color3.fromHSV(x,y,z)
Q.BackgroundTransparency=u.Transparency or U
Q.Position=UDim2.new(0.5,0,1-u.Transparency or U,0)
M.Frame.Frame.TextBox.Text=u:Round((1-u.Transparency or U)*100,0).."%"
end


if u.Flags then
d.Values[u.Flags]={
Color=Color3.fromHSV(x,y,z),
Transparency=u.Transparency or U
}
end
end

u:Update(u.Default,u.Transparency)




local function GetRGB()
local S=Color3.fromHSV(u.Hue,u.Sat,u.Vib)
return{R=math.floor(S.r*255),G=math.floor(S.g*255),B=math.floor(S.b*255)}
end



local function clamp(S,T,U)
return math.clamp(tonumber(S)or 0,T,U)
end

b.AddSignal(I.Frame.Frame.TextBox.FocusLost,function(S)
if S then
local T=I.Frame.Frame.TextBox.Text:gsub("#","")
local U,V=pcall(Color3.fromHex,T)
if U and typeof(V)=="Color3"then
u.Hue,u.Sat,u.Vib=Color3.toHSV(V)
u:Update()
u.Default=V
end
end
end)

local function updateColorFromInput(S,T)
b.AddSignal(S.Frame.Frame.TextBox.FocusLost,function(U)
if U then
local V=S.Frame.Frame.TextBox
local W=GetRGB()
local X=clamp(V.Text,0,255)
V.Text=tostring(X)

W[T]=X
local Y=Color3.fromRGB(W.R,W.G,W.B)
u.Hue,u.Sat,u.Vib=Color3.toHSV(Y)
u:Update()
end
end)
end

updateColorFromInput(J,"R")
updateColorFromInput(K,"G")
updateColorFromInput(L,"B")

if u.Transparency then
b.AddSignal(M.Frame.Frame.TextBox.FocusLost,function(S)
if S then
local T=M.Frame.Frame.TextBox
local U=clamp(T.Text,0,100)
T.Text=tostring(U)

u.Transparency=1-U*0.01
u:Update(nil,u.Transparency)
end
end)
end



local S=u.UIElements.SatVibMap
b.AddSignal(S.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while i:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=S.AbsolutePosition.X
local V=U+S.AbsoluteSize.X
local W=math.clamp(n.X,U,V)

local X=S.AbsolutePosition.Y
local Y=X+S.AbsoluteSize.Y
local Z=math.clamp(n.Y,X,Y)

u.Sat=(W-U)/(V-U)
u.Vib=1-((Z-X)/(Y-X))
u:Update()

l:Wait()
end
end
end)

b.AddSignal(H.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while i:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=H.AbsolutePosition.Y
local V=U+H.AbsoluteSize.Y
local W=math.clamp(n.Y,U,V)

u.Hue=((W-U)/(V-U))
u:Update()

l:Wait()
end
end
end)

if u.Transparency then
b.AddSignal(P.InputBegan,function(T)
if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then
while i:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local U=P.AbsolutePosition.Y
local V=U+P.AbsoluteSize.Y
local W=math.clamp(n.Y,U,V)

u.Transparency=1-((W-U)/(V-U))
u:Update()

l:Wait()
end
end
end)
end

return u
end

function q.New(r,s)
local t={
__type="Colorpicker",
Title=s.Title or"Colorpicker",
Desc=s.Desc or nil,
Locked=s.Locked or false,
Default=s.Default or Color3.new(1,1,1),
Callback=s.Callback or function()end,
Window=s.Window,
Transparency=s.Transparency,
UIElements={}
}

local u=true


t.ColorpickerFrame=a.load'o'{
Title=t.Title,
Desc=t.Desc,
Parent=s.Parent,
TextOffset=40,
Hover=false,
}

t.UIElements.Colorpicker=b.NewRoundFrame(q.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=t.Default,
Parent=t.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ZIndex=2
},nil,true)


function t.Lock(v)
u=false
return t.ColorpickerFrame:Lock()
end
function t.Unlock(v)
u=true
return t.ColorpickerFrame:Unlock()
end

if t.Locked then
t:Lock()
end


function t.Update(v,w,x)
t.UIElements.Colorpicker.ImageTransparency=x or 0
t.UIElements.Colorpicker.ImageColor3=w
t.Default=w
if x then
t.Transparency=x
end
end

function t.Set(v,w,x)
return t:Update(w,x)
end

b.AddSignal(t.UIElements.Colorpicker.MouseButton1Click,function()
if u then
q:Colorpicker(t,function(v,w)
t:Update(v,w)
t.Default=v
t.Transparency=w
b.SafeCallback(t.Callback,v,w)
end).ColorpickerFrame:Open()
end
end)


if t.Flags then
d:Register(t.Flags,t)
end

return t.__type,t
end

return q end function a.B()
local b=a.load'a'
local d=a.load'c'
local f=b.New
local h=b.Tween

local i={}

function i.New(j,k)
local l={
__type="Section",
Title=k.Title or"Section",
Icon=k.Icon,
TextXAlignment=k.TextXAlignment or"Left",
TextSize=k.TextSize or 19,
Flags=k.Flags or nil,
UIElements={},
}

local m
if l.Icon then
m=b.Image(
l.Icon,
l.Icon..":"..l.Title,
0,
k.Window.Folder,
l.__type,
true
)
m.Size=UDim2.new(0,24,0,24)
end

l.UIElements.Main=f("TextLabel",{
BackgroundTransparency=1,
TextXAlignment="Left",
AutomaticSize="XY",
TextSize=l.TextSize,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),


Text=l.Title,
})

f("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=k.Parent,
},{
m,
l.UIElements.Main,
f("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=l.TextXAlignment,
}),
f("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,2),
})
})





function l.SetTitle(n,o)
l.UIElements.Main.Text=o
end
function l.Destroy(n)
l.UIElements.Main.AutomaticSize="None"
l.UIElements.Main.Size=UDim2.new(1,0,0,l.UIElements.Main.TextBounds.Y)

h(l.UIElements.Main,.1,{TextTransparency=1}):Play()
task.wait(.1)
h(l.UIElements.Main,.15,{Size=UDim2.new(1,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end


if l.Flags then
d:Register(l.Flags,l)
end

return l.__type,l
end

return i end function a.C()
game:GetService"UserInputService"
local b=game.Players.LocalPlayer:GetMouse()

local d=a.load'a'
local f=a.load'c'
local h=d.New
local i=d.Tween

local j=a.load'd'.New
local k=a.load'n'.New
local l=a.load'k'.New


local m={
Window=nil,
WindUI=nil,
Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(m)end
}

function m.Init(n,o,p,q)
m.Window=n
m.WindUI=o
m.ToolTipParent=p
m.TabHighlight=q
return m
end

function m.New(n)
local o={
__type="Tab",
Title=n.Title or"Tab",
Desc=n.Desc,
Icon=n.Icon,
IconThemed=n.IconThemed,
Locked=n.Locked,
ShowTabTitle=n.ShowTabTitle,
Selected=false,
Index=nil,
Parent=n.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=m.Window.UICorner-(m.Window.UIPadding/2),
}

local p=m.Window
local q=m.WindUI

m.TabCount=m.TabCount+1
local r=m.TabCount
o.Index=r

o.UIElements.Main=d.NewRoundFrame(o.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=n.Parent,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
},{
d.NewRoundFrame(o.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
h("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
d.NewRoundFrame(o.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
h("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
h("TextLabel",{
Text=o.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not o.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
h("UIPadding",{
PaddingTop=UDim.new(0,2+(p.UIPadding/2)),
PaddingLeft=UDim.new(0,4+(p.UIPadding/2)),
PaddingRight=UDim.new(0,4+(p.UIPadding/2)),
PaddingBottom=UDim.new(0,2+(p.UIPadding/2)),
})
}),
},true)

local s=0
local t
local u

if o.Icon then
t=d.Image(
o.Icon,
o.Icon..":"..o.Title,
0,
m.Window.Folder,
o.__type,
true,
o.IconThemed
)
t.Size=UDim2.new(0,16,0,16)
t.Parent=o.UIElements.Main.Frame
t.ImageLabel.ImageTransparency=not o.Locked and 0 or.7
o.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,-30,0,0)
s=-30

o.UIElements.Icon=t


u=d.Image(
o.Icon,
o.Icon..":"..o.Title,
0,
m.Window.Folder,
o.__type,
true,
o.IconThemed
)
u.Size=UDim2.new(0,16,0,16)
u.ImageLabel.ImageTransparency=not o.Locked and 0 or.7
s=-30




end

o.UIElements.ContainerFrame=h("ScrollingFrame",{
Size=UDim2.new(1,0,1,o.ShowTabTitle and-((p.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
h("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
h("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6),
HorizontalAlignment="Center",
})
})





o.UIElements.ContainerFrameCanvas=h("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=p.UIElements.MainBar,
ZIndex=5,
},{
o.UIElements.ContainerFrame,
h("Frame",{
Size=UDim2.new(1,0,0,((p.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=o.ShowTabTitle or false,
Name="TabTitle"
},{
u,
h("TextLabel",{
Text=o.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-s,1,0),
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
h("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
h("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
h("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((p.UIPadding*2.4)+12)),
Visible=o.ShowTabTitle or false,
})
})

m.Containers[r]=o.UIElements.ContainerFrameCanvas
m.Tabs[r]=o

o.ContainerFrame=ContainerFrameCanvas

d.AddSignal(o.UIElements.Main.MouseButton1Click,function()
if not o.Locked then
m:SelectTab(r)
end
end)

l(o.UIElements.ContainerFrame,o.UIElements.ContainerFrameCanvas,p,3)

local v
local w
local x
local y=false



if o.Desc then


d.AddSignal(o.UIElements.Main.InputBegan,function()
y=true
w=task.spawn(function()
task.wait(0.35)
if y and not v then
v=k(o.Desc,m.ToolTipParent)

local function updatePosition()
if v then
v.Container.Position=UDim2.new(0,b.X,0,b.Y-20)
end
end

updatePosition()
x=b.Move:Connect(updatePosition)
v:Open()
end
end)
end)

end

d.AddSignal(o.UIElements.Main.MouseEnter,function()
if not o.Locked then
i(o.UIElements.Main.Frame,0.08,{ImageTransparency=.97}):Play()
end
end)
d.AddSignal(o.UIElements.Main.InputEnded,function()
if o.Desc then
y=false
if w then
task.cancel(w)
w=nil
end
if x then
x:Disconnect()
x=nil
end
if v then
v:Close()
v=nil
end
end

if not o.Locked then
i(o.UIElements.Main.Frame,0.08,{ImageTransparency=1}):Play()
end
end)



local z={
Button=a.load'p',
Toggle=a.load's',
Slider=a.load't',
Keybind=a.load'u',
Input=a.load'v',
Dropdown=a.load'w',
Code=a.load'z',
Colorpicker=a.load'A',
Section=a.load'B',
}

function o.Divider(A)
local B=h("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local C=h("Frame",{
Parent=o.UIElements.ContainerFrame,
Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
B
})

return C
end

function o.Paragraph(A,B)
B.Parent=o.UIElements.ContainerFrame
B.Window=p
B.Hover=false

B.TextOffset=0
B.IsButtons=B.Buttons and#B.Buttons>0 and true or false

local C={
__type="Paragraph",
Title=B.Title or"Paragraph",
Desc=B.Desc or nil,

Locked=B.Locked or false,
Flags=B.Flags or nil,
}
local D=a.load'o'(B)

C.ParagraphFrame=D
if B.Buttons and#B.Buttons>0 then
local E=h("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=D.UIElements.Container
},{
h("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for F,G in next,B.Buttons do
local H=j(G.Title,G.Icon,G.Callback,"White",E)
H.Size=UDim2.new(1,0,0,38)

end
end

function C.SetTitle(E,F)
C.ParagraphFrame:SetTitle(F)
C.Title=F


if C.Flags then
f.Values[C.Flags]={
Title=F,
Desc=C.Desc
}
end
end
function C.SetDesc(E,F)
C.ParagraphFrame:SetDesc(F)
C.Desc=F


if C.Flags then
f.Values[C.Flags]={
Title=C.Title,
Desc=F
}
end
end
function C.Destroy(E)
C.ParagraphFrame:Destroy()
end


if C.Flags then
f:Register(C.Flags,C)

f.Values[C.Flags]={
Title=C.Title,
Desc=C.Desc
}
end

table.insert(o.Elements,C)
return C
end

for A,B in pairs(z)do
o[A]=function(C,D)
D.Parent=C.UIElements.ContainerFrame
D.Window=p
D.WindUI=q local

E, F=B:New(D)
table.insert(C.Elements,F)

local G
for H,I in pairs(F)do
if typeof(I)=="table"and H:match"Frame$"then
G=I
break
end
end

if G then
function F.SetTitle(H,I)
G:SetTitle(I)
end
function F.SetDesc(H,I)
G:SetDesc(I)
end
function F.Destroy(H)
G:Destroy()
end
end
return F
end
end


task.spawn(function()
local A=h("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-p.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=o.UIElements.ContainerFrame
},{
h("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
h("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=d.Icon"frown"[1],
ImageRectOffset=d.Icon"frown"[2].ImageRectPosition,
ImageRectSize=d.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
h("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
})
})





d.AddSignal(o.UIElements.ContainerFrame.ChildAdded,function()
A.Visible=false
end)
end)

return o
end

function m.OnChange(n,o)
m.OnChangeFunc=o
end

function m.SelectTab(n,o)
if not m.Tabs[o].Locked then
m.SelectedTab=o

for p,q in next,m.Tabs do
if not q.Locked then
i(q.UIElements.Main,0.15,{ImageTransparency=1}):Play()
i(q.UIElements.Main.Outline,0.15,{ImageTransparency=1}):Play()
i(q.UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0.3}):Play()
if q.UIElements.Icon then
i(q.UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.4}):Play()
end
q.Selected=false
end
end
i(m.Tabs[o].UIElements.Main,0.15,{ImageTransparency=0.95}):Play()
i(m.Tabs[o].UIElements.Main.Outline,0.15,{ImageTransparency=0.85}):Play()
i(m.Tabs[o].UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0}):Play()
if m.Tabs[o].UIElements.Icon then
i(m.Tabs[o].UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.1}):Play()
end
m.Tabs[o].Selected=true


task.spawn(function()
for p,q in next,m.Containers do
q.AnchorPoint=Vector2.new(0,0.05)
q.Visible=false
end
m.Containers[o].Visible=true
i(m.Containers[o],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

m.OnChangeFunc(o)
end
end

return m end function a.D()
local b={}


local d=a.load'a'
local f=d.New
local h=d.Tween

local i=a.load'C'

function b.New(j,k,l,m)
local n={
Title=j.Title or"Section",
Icon=j.Icon,
IconThemed=j.IconThemed,
Opened=j.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local o
if n.Icon then
o=d.Image(
n.Icon,
n.Icon,
0,
l,
"Section",
true,
n.IconThemed
)

o.Size=UDim2.new(0,n.IconSize,0,n.IconSize)
o.ImageLabel.ImageTransparency=.25
end

local p=f("Frame",{
Size=UDim2.new(0,n.IconSize,0,n.IconSize),
BackgroundTransparency=1,
Visible=false
},{
f("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=d.Icon"chevron-down"[1],
ImageRectSize=d.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=d.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local q=f("Frame",{
Size=UDim2.new(1,0,0,n.HeaderSize),
BackgroundTransparency=1,
Parent=k,
ClipsDescendants=true,
},{
f("TextButton",{
Size=UDim2.new(1,0,0,n.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
o,
f("TextLabel",{
Text=n.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
o and(-n.IconSize-10)*2
or(-n.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
f("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
p,
f("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
f("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,n.HeaderSize)
},{
f("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,0),
VerticalAlignment="Bottom",
}),
})
})


function n.Tab(r,s)
if not n.Expandable then
n.Expandable=true
p.Visible=true
end
s.Parent=q.Content
return i.New(s)
end

function n.Open(r)
if n.Expandable then
n.Opened=true
h(q,0.33,{
Size=UDim2.new(1,0,0,n.HeaderSize+(q.Content.AbsoluteSize.Y/m))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

h(p.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function n.Close(r)
if n.Expandable then
n.Opened=false
h(q,0.26,{
Size=UDim2.new(1,0,0,n.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
h(p.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

d.AddSignal(q.TextButton.MouseButton1Click,function()
if n.Expandable then
if n.Opened then
n:Close()
else
n:Open()
end
end
end)

if n.Opened then
task.spawn(function()
task.wait()
n:Open()
end)
end



return n
end


return b end function a.E()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.F()
game:GetService"UserInputService"

local b={
Margin=8,
Padding=9,
}


local d=a.load'a'
local f=d.New
local h=d.Tween


function b.new(i,j,k)
local l={
IconSize=14,
Padding=14,
Radius=18,
Width=400,
MaxHeight=380,

Icons=a.load'E'
}


local m=f("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((l.IconSize*2)+(l.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(d.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local n=f("ImageLabel",{
Image=d.Icon"x"[1],
ImageRectSize=d.Icon"x"[2].ImageRectSize,
ImageRectOffset=d.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,l.IconSize,0,l.IconSize)
},{
f("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local o=f("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
f("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
f("UIPadding",{
PaddingTop=UDim.new(0,l.Padding),
PaddingLeft=UDim.new(0,l.Padding),
PaddingRight=UDim.new(0,l.Padding),
PaddingBottom=UDim.new(0,l.Padding),
})
})

local p=d.NewRoundFrame(l.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
f("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
f("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








f("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
f("ImageLabel",{
Image=d.Icon"search"[1],
ImageRectSize=d.Icon"search"[2].ImageRectSize,
ImageRectOffset=d.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.05,
Size=UDim2.new(0,l.IconSize,0,l.IconSize)
}),
m,
n,
f("UIListLayout",{
Padding=UDim.new(0,l.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
f("UIPadding",{
PaddingLeft=UDim.new(0,l.Padding),
PaddingRight=UDim.new(0,l.Padding),
})
})
}),
f("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
f("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
o,
f("UISizeConstraint",{
MaxSize=Vector2.new(l.Width,l.MaxHeight),
}),
}),
f("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local q=f("Frame",{
Size=UDim2.new(0,l.Width,0,0),
AutomaticSize="Y",
Parent=j,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
f("UIScale",{
Scale=.9,
}),
p,
d.NewRoundFrame(l.Radius,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=.7,
},{
f("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

local function CreateSearchTab(r,s,t,u,v,w)
local x=f("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=u or nil
},{
d.NewRoundFrame(l.Radius-4,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
f("UIPadding",{
PaddingTop=UDim.new(0,l.Padding-2),
PaddingLeft=UDim.new(0,l.Padding),
PaddingRight=UDim.new(0,l.Padding),
PaddingBottom=UDim.new(0,l.Padding-2),
}),
f("ImageLabel",{
Image=d.Icon(t)[1],
ImageRectSize=d.Icon(t)[2].ImageRectSize,
ImageRectOffset=d.Icon(t)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,l.IconSize,0,l.IconSize)
}),
f("Frame",{
Size=UDim2.new(1,-l.IconSize-l.Padding,0,0),
BackgroundTransparency=1,
},{
f("TextLabel",{
Text=r,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
f("TextLabel",{
Text=s or"",
Visible=s and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.2,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
f("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
f("UIListLayout",{
Padding=UDim.new(0,l.Padding),
FillDirection="Horizontal",
})
},true),
f("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-l.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=v,

},{
d.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
f("Frame",{
Size=UDim2.new(1,-l.Padding-2,0,0),
Position=UDim2.new(0,l.Padding+2,0,0),
BackgroundTransparency=1,
},{
f("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
f("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



x.Main.Size=UDim2.new(
1,
0,
0,
x.Main.Frame.Desc.Visible and(((l.Padding-2)*2)+x.Main.Frame.Title.TextBounds.Y+6+x.Main.Frame.Desc.TextBounds.Y)
or(((l.Padding-2)*2)+x.Main.Frame.Title.TextBounds.Y)
)

d.AddSignal(x.Main.MouseEnter,function()
h(x.Main,.04,{ImageTransparency=.95}):Play()
end)
d.AddSignal(x.Main.InputEnded,function()
h(x.Main,.08,{ImageTransparency=1}):Play()
end)
d.AddSignal(x.Main.MouseButton1Click,function()
if w then
w()
end
end)

return x
end

local function ContainsText(r,s)
if not s or s==""then
return false
end

if not r or r==""then
return false
end

local t=string.lower(r)
local u=string.lower(s)

return string.find(t,u,1,true)~=nil
end

local function Search(r)
if not r or r==""then
return{}
end

local s={}
for t,u in next,i.Tabs do
local v=ContainsText(u.Title or"",r)
local w={}

for x,y in next,u.Elements do
if y.__type~="Section"then
local z=ContainsText(y.Title or"",r)
local A=ContainsText(y.Desc or"",r)

if z or A then
w[x]={
Title=y.Title,
Desc=y.Desc,
Original=y,
__type=y.__type
}
end
end
end

if v or next(w)~=nil then
s[t]={
Tab=u,
Title=u.Title,
Icon=u.Icon,
Elements=w,
}
end
end
return s
end

function l.Search(r,s)
s=s or""

local t=Search(s)

o.Visible=true
p.Frame.Results.Frame.Visible=true
for u,v in next,o:GetChildren()do
if v.ClassName~="UIListLayout"and v.ClassName~="UIPadding"then
v:Destroy()
end
end

if t and next(t)~=nil then
for u,v in next,t do
local w=l.Icons.Tab
local x=CreateSearchTab(v.Title,nil,w,o,true,function()
l:Close()
i:SelectTab(u)
end)
if v.Elements and next(v.Elements)~=nil then
for y,z in next,v.Elements do
local A=l.Icons[z.__type]
CreateSearchTab(z.Title,z.Desc,A,x:FindFirstChild"ParentContainer"and x.ParentContainer.Frame or nil,false,function()
l:Close()
i:SelectTab(u)

end)

end
end
end
elseif s~=""then
f("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
Parent=o,
Name="NotFound",
})
else
o.Visible=false
p.Frame.Results.Frame.Visible=false
end
end

d.AddSignal(m:GetPropertyChangedSignal"Text",function()
l:Search(m.Text)
end)

d.AddSignal(o.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

h(o,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(o.UIListLayout.AbsoluteContentSize.Y+(l.Padding*2),0,l.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function l.Open(r)
task.spawn(function()
p.Frame.Visible=true
q.Visible=true
h(q.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function l.Close(r)
task.spawn(function()
k()
p.Frame.Visible=false
h(q.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
q.Visible=false
end)
end

d.AddSignal(n.TextButton.MouseButton1Click,function()
l:Close()
end)

l:Open()

return l
end

return b end function a.G()

local b=game:GetService"UserInputService"
game:GetService"RunService"

local d=workspace.CurrentCamera

local f=a.load'a'
local h=f.New
local i=f.Tween


local j=a.load'j'.New
local k=a.load'd'.New
local l=a.load'k'.New

local m=a.load'l'

local n=false

return function(o)
local p={
Title=o.Title or"UI Library",
Author=o.Author,
Icon=o.Icon,
IconThemed=o.IconThemed,
Folder=o.Folder,
Resizable=o.Resizable,
Background=o.Background,
BackgroundImageTransparency=o.BackgroundImageTransparency or 0,
User=o.User or{},
Size=o.Size and UDim2.new(
0,math.clamp(o.Size.X.Offset,480,700),
0,math.clamp(o.Size.Y.Offset,350,520))or UDim2.new(0,580,0,460),
ToggleKey=o.ToggleKey or Enum.KeyCode.G,
Transparent=o.Transparent or false,
HideSearchBar=o.HideSearchBar,
ScrollBarEnabled=o.ScrollBarEnabled or false,
SideBarWidth=o.SideBarWidth or 200,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=o.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=false,
IsOpenButtonEnabled=true,

ConfigManager=nil,
CurrentTab=nil,
TabModule=nil,

OnCloseCallback=nil,
OnDestroyCallback=nil,

TopBarButtons={},

}

if p.HideSearchBar~=false then
p.HideSearchBar=true
end
if p.Resizable~=false then
p.CanResize=true
p.Resizable=true
end

if p.Folder then
makefolder("WindUI/"..p.Folder)
end

local q=h("UICorner",{
CornerRadius=UDim.new(0,p.UICorner)
})

p.ConfigManager=m:Init(p)



local r=h("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
h("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local s=f.NewRoundFrame(p.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
h("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=f.Icon"expand"[1],
ImageRectOffset=f.Icon"expand"[2].ImageRectPosition,
ImageRectSize=f.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local t=f.NewRoundFrame(p.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










p.UIElements.SideBar=h("ScrollingFrame",{
Size=UDim2.new(
1,
p.ScrollBarEnabled and-3-(p.UIPadding/2)or 0,
1,
not p.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
h("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
h("UIPadding",{
PaddingTop=UDim.new(0,p.UIPadding/2),


PaddingBottom=UDim.new(0,p.UIPadding/2),
}),
h("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,0)
})
}),
h("UIPadding",{

PaddingLeft=UDim.new(0,p.UIPadding/2),
PaddingRight=UDim.new(0,p.UIPadding/2),

}),

})

p.UIElements.SideBarContainer=h("Frame",{
Size=UDim2.new(0,p.SideBarWidth,1,p.User.Enabled and-94-(p.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
h("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not p.HideSearchBar and-45-p.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
p.UIElements.SideBar,
})

if p.ScrollBarEnabled then
l(p.UIElements.SideBar,p.UIElements.SideBarContainer.Content,p,3)
end


p.UIElements.MainBar=h("Frame",{
Size=UDim2.new(1,-p.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
f.NewRoundFrame(p.UICorner-(p.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.95,
Name="Background",
}),
h("UIPadding",{
PaddingTop=UDim.new(0,p.UIPadding/2),
PaddingLeft=UDim.new(0,p.UIPadding/2),
PaddingRight=UDim.new(0,p.UIPadding/2),
PaddingBottom=UDim.new(0,p.UIPadding/2),
})
})

local u=h("ImageLabel",{
Image="rbxassetid://8992230677",
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

local v

if b.TouchEnabled and not b.KeyboardEnabled then
v=false
elseif b.KeyboardEnabled then
v=true
else
v=nil
end









local w
if p.User.Enabled then local
x, y=game.Players:GetUserThumbnailAsync(
p.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

w=h("TextButton",{
Size=UDim2.new(0,
(p.UIElements.SideBarContainer.AbsoluteSize.X)-(p.UIPadding/2),
0,
42+(p.UIPadding)
),
Position=UDim2.new(0,p.UIPadding/2,1,-(p.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
},{
f.NewRoundFrame(p.UICorner-(p.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
h("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
f.NewRoundFrame(p.UICorner-(p.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
h("ImageLabel",{
Image=x,
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
h("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
h("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
h("TextLabel",{
Text=p.User.Anonymous and"Anonymous"or game.Players.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(f.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
h("TextLabel",{
Text=p.User.Anonymous and"@anonymous"or"@"..game.Players.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(f.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
h("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
h("UIListLayout",{
Padding=UDim.new(0,p.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
h("UIPadding",{
PaddingLeft=UDim.new(0,p.UIPadding/2),
PaddingRight=UDim.new(0,p.UIPadding/2),
})
})
})

if p.User.Callback then
f.AddSignal(w.MouseButton1Click,function()
p.User.Callback()
end)
f.AddSignal(w.MouseEnter,function()
i(w.UserIcon,0.04,{ImageTransparency=.95}):Play()
i(w.Outline,0.04,{ImageTransparency=.85}):Play()
end)
f.AddSignal(w.InputEnded,function()
i(w.UserIcon,0.04,{ImageTransparency=1}):Play()
i(w.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local x
local y


local z=f.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
h("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

local A=h("TextLabel",{
Text=p.Title,
FontFace=Font.new(f.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

p.UIElements.Main=h("Frame",{
Size=p.Size,
Position=p.Position,
BackgroundTransparency=1,
Parent=o.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
u,
f.NewRoundFrame(p.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},

},{
h("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=p.Background,
ImageTransparency=1,
ScaleType="Crop",
},{
h("UICorner",{
CornerRadius=UDim.new(0,p.UICorner)
}),
}),
z,
r,



}),
UIStroke,
q,
s,
t,
h("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
h("UICorner",{
CornerRadius=UDim.new(0,p.UICorner)
}),
p.UIElements.SideBarContainer,
p.UIElements.MainBar,

w,

y,
h("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
x,






h("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
h("UIListLayout",{
Padding=UDim.new(0,p.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
h("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
h("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Top",
}),
A,
}),
h("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
h("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
h("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
h("UIPadding",{
PaddingTop=UDim.new(0,p.UIPadding),
PaddingLeft=UDim.new(0,p.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,p.UIPadding),
})
})
})
})


function p.CreateTopbarButton(B,C,D,E,F,G)
local H=f.Image(
D,
D,
0,
p.Folder,
"TopbarIcon",
true,
G
)
H.Size=UDim2.new(0,16,0,16)
H.AnchorPoint=Vector2.new(0.5,0.5)
H.Position=UDim2.new(0.5,0,0.5,0)

local I=f.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0,36,0,36),
LayoutOrder=F or 999,
Parent=p.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=1
},{
f.NewRoundFrame(9,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
h("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
H
},true)



p.TopBarButtons[100-F]={
Name=C,
Object=I
}

f.AddSignal(I.MouseButton1Click,function()
E()
end)
f.AddSignal(I.MouseEnter,function()
i(I,.15,{ImageTransparency=.93}):Play()
i(I.Outline,.15,{ImageTransparency=.75}):Play()

end)
f.AddSignal(I.MouseLeave,function()
i(I,.1,{ImageTransparency=1}):Play()
i(I.Outline,.1,{ImageTransparency=1}):Play()

end)

return I
end



local B=f.Drag(
p.UIElements.Main,
{p.UIElements.Main.Main.Topbar,z.Frame},
function(B,C)
if not p.Closed then
if B and C==z.Frame then
i(z,.1,{ImageTransparency=.35}):Play()
else
i(z,.2,{ImageTransparency=.8}):Play()
end
end
end
)














if p.Author then
h("TextLabel",{
Text=p.Author,
FontFace=Font.new(f.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.4,
AutomaticSize="XY",
Parent=p.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
}
})

end

local C=a.load'm'.New(p)


task.spawn(function()
if p.Icon then

local D=f.Image(
p.Icon,
p.Title,
0,
p.Folder,
"Window",
true,
p.IconThemed
)
D.Parent=p.UIElements.Main.Main.Topbar.Left
D.Size=UDim2.new(0,22,0,22)

C:SetIcon(p.Icon)











else
C:SetIcon(p.Icon)
OpenButtonIcon.Visible=false
end
end)

function p.SetToggleKey(D,E)
p.ToggleKey=E
end

function p.SetBackgroundImage(D,E)
p.UIElements.Main.Background.ImageLabel.Image=E
end
function p.SetBackgroundImageTransparency(D,E)
p.UIElements.Main.Background.ImageLabel.ImageTransparency=E
p.BackgroundImageTransparency=E
end

local D
local E
f.Icon"minimize"
f.Icon"maximize"

p:CreateTopbarButton("Fullscreen","maximize",function()
p:ToggleFullscreen()
end,998)

function p.ToggleFullscreen(F)
local G=p.IsFullscreen

B:Set(G)

if not G then
D=p.UIElements.Main.Position
E=p.UIElements.Main.Size

p.CanResize=false
else
if p.Resizable then
p.CanResize=true
end
end

i(p.UIElements.Main,0.45,{Size=G and E or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

i(p.UIElements.Main,0.45,{Position=G and D or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



p.IsFullscreen=not G
end


p:CreateTopbarButton("Minimize","minus",function()
p:Close()
task.spawn(function()
task.wait(.3)
if not v and p.IsOpenButtonEnabled then

C:Visible(true)
end
end)

local F=v and"Press "..p.ToggleKey.Name.." to open the Window"or"Click the Button to open the Window"

if not p.IsOpenButtonEnabled then
n=true
end
if not n then
n=not n
o.WindUI:Notify{
Title="Minimize",
Content="You've closed the Window. "..F,
Icon="eye-off",
Duration=5,
}
end
end,997)

function p.OnClose(F,G)
p.OnCloseCallback=G
end
function p.OnDestroy(F,G)
p.OnDestroyCallback=G
end

function p.Open(F)
task.spawn(function()
task.wait(.06)
p.Closed=false

i(p.UIElements.Main.Background,0.2,{
ImageTransparency=p.Transparent and o.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

i(p.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

i(p.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=p.BackgroundImageTransparency},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

i(u,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
i(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.5)
i(z,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
task.wait(.45)
B:Set(true)
if p.Resizable then
i(r.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
p.CanResize=true
end
end)


p.CanDropdown=true

p.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
p.UIElements.Main.Main.Visible=true
end)
end)
end
function p.Close(F)
local G={}

if p.OnCloseCallback then
task.spawn(function()
f.SafeCallback(p.OnCloseCallback)
end)
end

p.UIElements.Main.Main.Visible=false
p.CanDropdown=false
p.Closed=true

i(p.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()

i(p.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


i(p.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
i(u,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
i(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

i(z,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
i(r.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
B:Set(false)
p.CanResize=false

task.spawn(function()
task.wait(0.4)
p.UIElements.Main.Visible=false
end)

function G.Destroy(H)
if p.OnDestroyCallback then
task.spawn(function()
f.SafeCallback(p.OnDestroyCallback)
end)
end
p.Destroyed=true
task.wait(0.4)
o.Parent.Parent:Destroy()


end

return G
end

function p.ToggleTransparency(F,G)

p.Transparent=G
o.WindUI.Transparent=G

p.UIElements.Main.Background.ImageTransparency=G and o.WindUI.TransparencyValue or 0

p.UIElements.MainBar.Background.ImageTransparency=G and 0.97 or 0.95

end


function p.SetUIScale(F,G)
o.WindUI.UIScale=G
i(o.WindUI.ScreenGui.UIScale,.2,{Scale=G},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

do

if(d.ViewportSize.X-40<p.UIElements.Main.AbsoluteSize.X)
or(d.ViewportSize.Y-40<p.UIElements.Main.AbsoluteSize.Y)then
if not p.IsFullscreen then
p:SetUIScale(.9)
end
end
end

if not v and p.IsOpenButtonEnabled then
f.AddSignal(C.Button.TextButton.MouseButton1Click,function()

C:Visible(false)
p:Open()
end)
end

f.AddSignal(b.InputBegan,function(F,G)
if G then return end

if F.KeyCode==p.ToggleKey then
if p.Closed then
p:Open()
else
p:Close()
end
end
end)

task.spawn(function()

p:Open()
end)

function p.EditOpenButton(F,G)
return C:Edit(G)
end


local F=a.load'C'
local G=a.load'D'
local H=F.Init(p,o.WindUI,o.Parent.Parent.ToolTips)
H:OnChange(function(I)p.CurrentTab=I end)

p.TabModule=F

function p.Tab(I,J)
J.Parent=p.UIElements.SideBar.Frame
return H.New(J)
end

function p.SelectTab(I,J)
H:SelectTab(J)
end

function p.Section(I,J)
return G.New(J,p.UIElements.SideBar.Frame,p.Folder,o.WindUI.UIScale)
end

function p.IsResizable(I,J)
p.Resizable=J
p.CanResize=J
end

function p.Divider(I)
local J=h("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local K=h("Frame",{
Parent=p.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
J
})

return K
end

local I=a.load'f'.Init(p,nil)
function p.Dialog(J,K)
local L={
Title=K.Title or"Dialog",
Width=K.Width or 320,
Content=K.Content,
Buttons=K.Buttons or{},

TextPadding=10,
}
local M=I.Create(false)

M.UIElements.Main.Size=UDim2.new(0,L.Width,0,0)

local N=h("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=M.UIElements.Main
},{
h("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,M.UIPadding),
VerticalAlignment="Center"
}),
h("UIPadding",{
PaddingTop=UDim.new(0,L.TextPadding),
PaddingLeft=UDim.new(0,L.TextPadding),
PaddingRight=UDim.new(0,L.TextPadding),
})
})

local O
if K.Icon then
O=f.Image(
K.Icon,
L.Title..":"..K.Icon,
0,
p,
"Dialog",
true,
K.IconThemed
)
O.Size=UDim2.new(0,22,0,22)
O.Parent=N
end

M.UIElements.UIListLayout=h("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=M.UIElements.Main
})

h("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=M.UIElements.Main,
})


M.UIElements.Title=h("TextLabel",{
Text=L.Title,
TextSize=20,
FontFace=Font.new(f.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,O and-26-M.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=N
})
if L.Content then
h("TextLabel",{
Text=L.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(f.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=M.UIElements.Main
},{
h("UIPadding",{
PaddingLeft=UDim.new(0,L.TextPadding),
PaddingRight=UDim.new(0,L.TextPadding),
PaddingBottom=UDim.new(0,L.TextPadding),
})
})
end

local P=h("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local Q=h("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=M.UIElements.Main,
LayoutOrder=4,
},{
P,
})


local R={}

for S,T in next,L.Buttons do
local U=k(T.Title,T.Icon,T.Callback,T.Variant,Q,M,true)
table.insert(R,U)
end

local function CheckButtonsOverflow()
P.FillDirection=Enum.FillDirection.Horizontal
P.HorizontalAlignment=Enum.HorizontalAlignment.Right
P.VerticalAlignment=Enum.VerticalAlignment.Center
Q.AutomaticSize=Enum.AutomaticSize.None

for S,T in ipairs(R)do
T.Size=UDim2.new(0,0,1,0)
T.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local S=P.AbsoluteContentSize.X
local T=Q.AbsoluteSize.X

if S>T then
P.FillDirection=Enum.FillDirection.Vertical
P.HorizontalAlignment=Enum.HorizontalAlignment.Right
P.VerticalAlignment=Enum.VerticalAlignment.Bottom
Q.AutomaticSize=Enum.AutomaticSize.Y

for U,V in ipairs(R)do
V.Size=UDim2.new(1,0,0,40)
V.AutomaticSize=Enum.AutomaticSize.None
end
else
local U=T-S
if U>0 then
local V
local W=math.huge

for X,Y in ipairs(R)do
local Z=Y.AbsoluteSize.X
if Z<W then
W=Z
V=Y
end
end

if V then
V.Size=UDim2.new(0,W+U,1,0)
V.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

f.AddSignal(M.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
M:Open()

return M
end

p:CreateTopbarButton("Close","x",function()
i(p.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
p:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()p:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)


local function startResizing(J)
if p.CanResize then
isResizing=true
s.Active=true
initialSize=p.UIElements.Main.Size
initialInputPosition=J.Position
i(s,0.12,{ImageTransparency=.65}):Play()
i(s.ImageLabel,0.12,{ImageTransparency=0}):Play()
i(r.ImageLabel,0.1,{ImageTransparency=.35}):Play()

f.AddSignal(J.Changed,function()
if J.UserInputState==Enum.UserInputState.End then
isResizing=false
s.Active=false
i(s,0.2,{ImageTransparency=1}):Play()
i(s.ImageLabel,0.17,{ImageTransparency=1}):Play()
i(r.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

f.AddSignal(r.InputBegan,function(J)
if J.UserInputType==Enum.UserInputType.MouseButton1 or J.UserInputType==Enum.UserInputType.Touch then
if p.CanResize then
startResizing(J)
end
end
end)

f.AddSignal(b.InputChanged,function(J)
if J.UserInputType==Enum.UserInputType.MouseMovement or J.UserInputType==Enum.UserInputType.Touch then
if isResizing and p.CanResize then
local K=J.Position-initialInputPosition
local L=UDim2.new(0,initialSize.X.Offset+K.X*2,0,initialSize.Y.Offset+K.Y*2)

i(p.UIElements.Main,0,{
Size=UDim2.new(
0,math.clamp(L.X.Offset,480,700),
0,math.clamp(L.Y.Offset,350,520)
)}):Play()
end
end
end)




if not p.HideSearchBar then
local J=a.load'F'
local K=false





















local L=j("Search","search",p.UIElements.SideBarContainer)
L.Size=UDim2.new(1,-p.UIPadding/2,0,39)
L.Position=UDim2.new(0,p.UIPadding/2,0,p.UIPadding/2)

f.AddSignal(L.MouseButton1Click,function()
if K then return end

J.new(p.TabModule,p.UIElements.Main,function()

K=false
if p.Resizable then
p.CanResize=true
end

i(t,0.1,{ImageTransparency=1}):Play()
t.Active=false
end)
i(t,0.1,{ImageTransparency=.65}):Play()
t.Active=true

K=true
p.CanResize=false
end)
end




function p.DisableTopbarButtons(J,K)
for L,M in next,K do
for N,O in next,p.TopBarButtons do
if O.Name==M then
O.Object.Visible=false
end
end
end
end

return p
end end end
local b={
Window=nil,
Theme=nil,
Creator=a.load'a',
Themes=a.load'b',
FlagManager=a.load'c',
Transparent=false,

TransparencyValue=.15,

UIScale=1,

ConfigManager=nil
}


local d=a.load'g'

local f=b.Themes
local h=b.Creator

local i=h.New local j=
h.Tween

h.Themes=f

local k=game:GetService"Players"and game:GetService"Players".LocalPlayer or nil
b.Themes=f

local l=protectgui or(syn and syn.protect_gui)or function()end

local m=gethui and gethui()or game.CoreGui


b.ScreenGui=i("ScreenGui",{
Name="WindUI",
Parent=m,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
i("UIScale",{
Scale=b.Scale,
}),
i("Folder",{
Name="Window"
}),






i("Folder",{
Name="KeySystem"
}),
i("Folder",{
Name="Popups"
}),
i("Folder",{
Name="ToolTips"
})
})

b.NotificationGui=i("ScreenGui",{
Name="WindUI/Notifications",
Parent=m,
IgnoreGuiInset=true,
})
b.DropdownGui=i("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=m,
IgnoreGuiInset=true,
})
l(b.ScreenGui)
l(b.NotificationGui)
l(b.DropdownGui)

h.Init(b)

math.clamp(b.TransparencyValue,0,0.4)

local n=a.load'h'
local o=n.Init(b.NotificationGui)

function b.Notify(p,q)
q.Holder=o.Frame
q.Window=b.Window
q.WindUI=b
return n.New(q)
end

function b.SetNotificationLower(p,q)
o.SetLower(q)
end

function b.SetFont(p,q)
h.UpdateFont(q)
end

function b.AddTheme(p,q)
f[q.Name]=q
return q
end

function b.SetTheme(p,q)
if f[q]then
b.Theme=f[q]
h.SetTheme(f[q])
h.UpdateTheme()

return f[q]
end
return nil
end

b:SetTheme"Dark"

function b.GetThemes(p)
return f
end
function b.GetCurrentTheme(p)
return b.Theme.Name
end
function b.GetTransparency(p)
return b.Transparent or false
end
function b.GetWindowSize(p)
return Window.UIElements.Main.Size
end


function b.Popup(p,q)
q.WindUI=b
return a.load'i'.new(q)
end


function b.CreateWindow(p,q)
local r=a.load'G'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if q.Folder then
makefolder(q.Folder)
else
makefolder(q.Title)
end

q.WindUI=b
q.Parent=b.ScreenGui.Window

if b.Window then
warn"You cannot create more than one window"
return
end

local s=true

local t=f[q.Theme or"Dark"]

b.Theme=t

h.SetTheme(t)

local u=k.Name or"Unknown"

if q.KeySystem then
s=false
if q.KeySystem.SaveKey and q.Folder then
if isfile(q.Folder.."/"..u..".key")then
local v
if type(q.KeySystem.Key)=="table"then
v=table.find(q.KeySystem.Key,readfile(q.Folder.."/"..u..".key"))
else
v=tostring(q.KeySystem.Key)==tostring(readfile(q.Folder.."/"..u..".key"))
end
if v then
s=true
end
else
d.new(q,u,function(v)s=v end)
end
else
d.new(q,u,function(v)s=v end)
end
repeat task.wait()until s
end

local v=r(q)

b.Transparent=q.Transparent
b.Window=v















v.GetFlag=function(w)
return b.FlagManager:GetFlag(w)
end

v.SetFlag=function(w,x)
return b.FlagManager:SetFlag(w,x)
end

v.GetFlags=function()
return b.FlagManager:GetAllFlags()
end

return v
end


function b.GetFlags(p)
return p.FlagManager:GetAllFlags()
end

function b.GetFlag(p,q)
return p.FlagManager:GetFlag(q)
end

function b.SetFlag(p,q,r)
return p.FlagManager:SetFlag(q,r)
end

return b
