local Layout_1 = ssr.GUI:Win_Create(0, "Layout_1", 0, 0, 1, 1)
local Img_default_1 =  ssr.GUI:Image_Create(Layout_1, "default_1", 0, 0, "res/public/bg_npc_01.png")
ssr.GUI:setTouchEnabled(Img_default_1, true)
local root_size = ssr.GUI:getContentSize(Img_default_1)
ssr.GUI:setContentSize(Layout_1, root_size)
ssr.GUI:Win_setShow(Layout_1, 0)
ssr.GUI:stopAllActions(Layout_1)
ssr.GUI:setAnchorPoint(Img_default_1,0, 1 )
ssr.GUI:setRotation(Img_default_1, 0)
local parent            = ssr.GUI:getParent(Img_default_1) 
local parentSize        = ssr.GUI:getContentSize(parent)
local x                 = 0
local y                 = parentSize.height - 0 
ssr.GUI:setPosition(Img_default_1, x, y)
ssr.GUI:setVisible(Img_default_1, true)
local Layout_default_2 = ssr.GUI:Win_Create(Layout_1, "default_2", 545, 0, 80, 80)
local contentSize       = ssr.GUI:getContentSize(Layout_default_2)
local defaultWidth      = contentSize.width
local defaultHeight     = contentSize.height
local width             = 80 or defaultWidth
local height            = 80 or defaultHeight
ssr.GUI:setContentSize(Layout_default_2, {width = width, height = height})
ssr.GUI:setAnchorPoint(Layout_default_2,0, 1 )
ssr.GUI:setRotation(Layout_default_2, 0)
local parent            = ssr.GUI:getParent(Layout_default_2) 
local parentSize        = ssr.GUI:getContentSize(parent)
local x                 = 545
local y                 = parentSize.height - 0 
ssr.GUI:setPosition(Layout_default_2, x, y)
ssr.GUI:setVisible(Layout_default_2, true)
local Button_default_3 = ssr.GUI:Button_Create(Layout_1, "default_3", 546, 0, "res/public/1900000510.png")
ssr.GUI:Button_setTitleText( Button_default_3,"")
ssr.GUI:Button_setTitleColor(Button_default_3, {r=255,b=255,g=255})
ssr.GUI:Button_setTitleFontSize(Button_default_3, 18)
ssr.GUI:Button_setMaxLineWidth(Button_default_3, 0)
ssr.GUI:Button_titleEnableOutline( Button_default_3, {r=0,b=0,g=0}, 0)
ssr.GUI:Button_loadTexturePressed(Button_default_3, "res/public/1900000511.png")
ssr.GUI:setAnchorPoint(Button_default_3,0, 1 )
ssr.GUI:setRotation(Button_default_3, 0)
local parent            = ssr.GUI:getParent(Button_default_3) 
local parentSize        = ssr.GUI:getContentSize(parent)
local x                 = 546
local y                 = parentSize.height - 0 
ssr.GUI:setPosition(Button_default_3, x, y)
ssr.GUI:setVisible(Button_default_3, true)
