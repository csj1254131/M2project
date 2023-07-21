LoginRolePanel = {}

LoginRolePanel.animLightID  = {4121, 4127, 4123, 4129, 4125, 4131}      -- 人物常亮动画id  顺序：男战士、女战士、男法师、女法师、男道士、女道士
LoginRolePanel.animGToLID   = {4122, 4128, 4124, 4130, 4126, 4132}      -- 人物灰到亮动画id   
LoginRolePanel.animPos      = {x=0, y=170}                              -- 人物特效位置    (基于 Node_anim_1/2)
LoginRolePanel.startBtnMask = {w=100, h=40, x= 66, y= 10}               -- 小退倒计时 加在开始按钮的遮罩大小和位置
LoginRolePanel.createJobPath= {         -- 创角页职业图标路径
    normal={
        [1] = "res/private/login/icon_cjzy_01.png",
        [2] = "res/private/login/icon_cjzy_02.png",
        [3] = "res/private/login/icon_cjzy_03.png",
    },
    select={
        [1] = "res/private/login/icon_cjzy_01_1.png",
        [2] = "res/private/login/icon_cjzy_02_1.png",
        [3] = "res/private/login/icon_cjzy_03_1.png",
    },
}

LoginRolePanel.createSexPath= {         -- 创角页性别图标路径
    normal={
        [1] = "res/private/login/icon_cjzy_06.png",
        [2] = "res/private/login/icon_cjzy_05.png",
    },
    select={
        [1] = "res/private/login/icon_cjzy_06_1.png",
        [2] = "res/private/login/icon_cjzy_05_1.png",
    },
}


function LoginRolePanel.main()
    local parent = ssr.GUI:Attach_Parent()
    if not parent then
        return
    end

    LoginRolePanel._CreateUI = nil
    LoginRolePanel._RestoreUI = nil

    local fontSize = (ssr.IsWinMode() and 12 or 16)

    local screenW = ssr.getWinWidth()
    local screenH = ssr.getWinHeight()

    local Panel_touch = ssr.GUI:Layout_Create(parent, "Panel_touch", 0, 0, screenW, screenH)
    ssr.GUI:setTouchEnabled(Panel_touch, true)

    local Panel_bg = ssr.GUI:Layout_Create(parent, "Panel_bg", screenW/2, screenH/2, 1136, 640)
    ssr.GUI:setAnchorPoint(Panel_bg, 0.5, 0.5)
    ssr.GUI:setTouchEnabled(Panel_bg, true)
    ssr.GUI:Layout_setBackGroundImage(Panel_bg, "res/private/login/bg_cjzy_02.jpg")
    -- ssr.GUI:Layout_setBackGroundImageScale9Slice(Panel_bg, 458, 458, 316, 316)

    local parentSize = ssr.GUI:getContentSize(Panel_bg)
    local pW   = parentSize.width
    local pH   = parentSize.height
    local Image_server_bg = ssr.GUI:Image_Create(Panel_bg, "Image_server_bg", pW/2, pH, "res/private/login/bg_cjzy_05.png")
    ssr.GUI:setAnchorPoint(Image_server_bg, {x=0.5, y=1})

    local Text_server_name = ssr.GUI:Text_Create(Panel_bg, "Text_server_name", pW/2, pH - 13, 15, "#FFFFFF", "服务器名")
    ssr.GUI:setAnchorPoint(Text_server_name, {x=0.5, y=0.5})

    local Panel_role = ssr.GUI:Layout_Create(Panel_bg, "Panel_role", pW/2, 595, 350, 400)
    ssr.GUI:setAnchorPoint(Panel_role, {x=0.5, y=1})
    ssr.GUI:setTouchEnabled(Panel_role, true)

    local Node_anim = ssr.GUI:Node_Create(Panel_role, "Node_anim", 175, 0)

    -- 角色1 信息展示----
    local Panel_info_1 = ssr.GUI:Layout_Create(Panel_bg, "Panel_info_1", pW - 80, pH - 80, 300, 90)
    ssr.GUI:setAnchorPoint(Panel_info_1, {x=1, y=1})
    ssr.GUI:setTouchEnabled(Panel_info_1, true)
    -- 背景
    local Img_infoBg_1 = ssr.GUI:Image_Create(Panel_info_1, "Img_infoBg_1", 153, 45, "res/private/login/normal_bg.png")
    ssr.GUI:setAnchorPoint(Img_infoBg_1, {x=0.5, y=0.5})
    -- 职业图标
    local Image_icon_1 = ssr.GUI:Image_Create(Panel_info_1, "Image_icon_1", 40, 43, "res/private/login/btn_add.png")
    ssr.GUI:setAnchorPoint(Image_icon_1, {x=0.5, y=0.5})
    ssr.GUI:addOnClick(Image_icon_1, function ()
        LoginRolePanel.RequestCreateRole()
    end)

    -- 角色昵称
    local Text_name_1 = ssr.GUI:Text_Create(Panel_info_1, "Text_name_1", 140, 60, fontSize, "#FFFFFF")
    ssr.GUI:setAnchorPoint(Text_name_1, {x=0.5, y=0.5})
    ssr.GUI:Text_setString(Text_name_1, "传奇经典")
    -- 角色等级
    local Text_level_1 = ssr.GUI:Text_Create(Panel_info_1, "Text_level_1", 140, 32, fontSize, "#FFFFFF")
    ssr.GUI:setAnchorPoint(Text_level_1, {x=0.5, y=0.5})
    ssr.GUI:Text_setString(Text_level_1, "9级")
    -- 选中框
    local choose_tag_1 = ssr.GUI:Image_Create(Panel_info_1, "choose_tag_1", 117, 45, "res/private/login/select_tag.png")
    ssr.GUI:setAnchorPoint(choose_tag_1, {x=0.5, y=0.5})
    ssr.GUI:setVisible(choose_tag_1, false)
    ssr.GUI:setTouchEnabled(choose_tag_1, false)

    -- 角色2 信息展示----
    local Panel_info_2 = ssr.GUI:Layout_Create(Panel_bg, "Panel_info_2", pW - 40, pH - 190, 300, 90)
    ssr.GUI:setAnchorPoint(Panel_info_2, {x=1, y=1})
    ssr.GUI:setTouchEnabled(Panel_info_2, true)
    
    local Img_infoBg_2 = ssr.GUI:Image_Create(Panel_info_2, "Img_infoBg_2", 153, 45, "res/private/login/normal_bg.png")
    ssr.GUI:setAnchorPoint(Img_infoBg_2, {x=0.5, y=0.5})

    local Image_icon_2 = ssr.GUI:Image_Create(Panel_info_2, "Image_icon_2", 40, 43, "res/private/login/btn_add.png")
    ssr.GUI:setAnchorPoint(Image_icon_2, {x=0.5, y=0.5})
    ssr.GUI:addOnClick(Image_icon_2, function ()
        LoginRolePanel.RequestCreateRole()
    end)

    local Text_name_2 = ssr.GUI:Text_Create(Panel_info_2, "Text_name_2", 140, 60, fontSize, "#FFFFFF")
    ssr.GUI:setAnchorPoint(Text_name_2, {x=0.5, y=0.5})
    ssr.GUI:Text_setString(Text_name_2, "传奇经典")

    local Text_level_2 = ssr.GUI:Text_Create(Panel_info_2, "Text_level_2", 140, 32, fontSize, "#FFFFFF")
    ssr.GUI:setAnchorPoint(Text_level_2, {x=0.5, y=0.5})
    ssr.GUI:Text_setString(Text_level_2, "9级")

    local choose_tag_2 = ssr.GUI:Image_Create(Panel_info_2, "choose_tag_2", 117, 45, "res/private/login/select_tag.png")
    ssr.GUI:setAnchorPoint(choose_tag_2, {x=0.5, y=0.5})
    ssr.GUI:setVisible(choose_tag_2, false)
    ssr.GUI:setTouchEnabled(choose_tag_2, false)


    --
    local Panel_act = ssr.GUI:Layout_Create(Panel_bg, "Panel_act", pW/2, 0, 350, 200)
    ssr.GUI:setAnchorPoint(Panel_act, {x=0.5, y=0})


    local Button_start = ssr.GUI:Button_Create(Panel_act, "Button_start", 164, 185, "res/private/login/btn_start_1.png")
    ssr.GUI:setAnchorPoint(Button_start, {x=0.5, y=0.5})  
    ssr.GUI:Button_loadTexturePressed(Button_start, "res/private/login/btn_start_2.png")

    local Button_leave = ssr.GUI:Button_Create(Panel_act, "Button_leave", 172, 82, "res/private/login/btn_back_1.png")
    ssr.GUI:setAnchorPoint(Button_leave, {x=0.5, y=0.5})  
    ssr.GUI:Button_loadTexturePressed(Button_leave, "res/private/login/btn_back_2.png")

    local Button_delete = ssr.GUI:Button_Create(Panel_act, "Button_delete", 232, 132, "res/private/login/btn_delete_1.png")
    ssr.GUI:setAnchorPoint(Button_delete, {x=0.5, y=0.5})  
    ssr.GUI:Button_loadTexturePressed(Button_delete, "res/private/login/btn_delete_2.png")

    local Button_restore = ssr.GUI:Button_Create(Panel_act, "Button_restore", 103, 132, "res/private/login/btn_restore_1.png")
    ssr.GUI:setAnchorPoint(Button_restore, {x=0.5, y=0.5})  
    ssr.GUI:Button_loadTexturePressed(Button_restore, "res/private/login/btn_restore_2.png")

    -- PC端使用按钮图片
    --[[
    local Image_start = ssr.GUI:Image_Create(Button_start, "Image_start", 66, 30, "res/private/login/c00005.png")
    ssr.GUI:setAnchorPoint(Image_start, {x=0.5, y=0.5})

    local Image_leave = ssr.GUI:Image_Create(Button_leave, "Image_leave", 66, 30, "res/private/login/c00002.png")
    ssr.GUI:setAnchorPoint(Image_leave, {x=0.5, y=0.5})

    local Image_create = ssr.GUI:Image_Create(Button_create, "Image_create", 66, 30, "res/private/login/c00001.png")
    ssr.GUI:setAnchorPoint(Image_create, {x=0.5, y=0.5})

    local Image_delete = ssr.GUI:Image_Create(Button_delete, "Image_delete", 66, 30, "res/private/login/c00006.png")
    ssr.GUI:setAnchorPoint(Image_start, {x=0.5, y=0.5})

    local Image_restore = ssr.GUI:Image_Create(Button_restore, "Image_restore", 66, 30, "res/private/login/c00004.png")
    ssr.GUI:setAnchorPoint(Image_restore, {x=0.5, y=0.5})

    ssr.GUI:setVisible(Image_start, ssr.IsWinMode())
    ssr.GUI:setVisible(Image_leave, ssr.IsWinMode())
    ssr.GUI:setVisible(Image_create, ssr.IsWinMode())
    ssr.GUI:setVisible(Image_delete, ssr.IsWinMode())
    ssr.GUI:setVisible(Image_restore, ssr.IsWinMode())

    if ssr.IsWinMode() then
        ssr.GUI:Button_setTitleText(Button_start, "")
        ssr.GUI:Button_setTitleText(Button_leave, "")
        ssr.GUI:Button_setTitleText(Button_create, "")
        ssr.GUI:Button_setTitleText(Button_delete, "")
        ssr.GUI:Button_setTitleText(Button_restore, "")
    end
    ]]

    LoginRolePanel.UI = ssr.UIQuickChild(Panel_bg)

    -- 设置交易行挂接父节点 取回按钮位置、新角色提示位置 -----------------
    local size = ssr.GUI:getContentSize(Panel_role)
    LoginRolePanel._TradeNode = {
        [1] = {     -- 角色1
            node = "Panel_role", -- 控件名
            backPos = {x = size.width/2, y = size.height/2+30},
            newPos = {x = 180, y = 370}
        },
        [2] = {     -- 角色2
            node = "Panel_role", -- 控件名
            backPos = {x = size.width/2, y = size.height/2+30},
            newPos = {x = 180, y = 370}
        },
    }
    -------------------------------------------------

    local function selectRole(index) 
        -- 创角/恢复中
        if LoginRolePanel._CreateUI or LoginRolePanel._RestoreUI then
            return
        end

        local roles = ssr.GetRolesData()
        if not roles[index] then
            return false
        end
        LoginRolePanel.index = index
        LoginRolePanel.SelectRole(index)
    end

    ssr.GUI:addOnClick(Panel_info_1, function ( ... )
        selectRole(1)
    end)
   
    ssr.GUI:addOnClick(Panel_info_2, function ( ... )
        selectRole(2)
    end)

end

-- 更新角色信息 
function LoginRolePanel.UpdateRoles()
    local roles = ssr.GetRolesData()
    -- level 等级 name 昵称 job 职业 012
    --
    for i = 1, 2 do
        ssr.GUI:Text_setString(LoginRolePanel.UI["Text_level_"..i], "")
        ssr.GUI:Text_setString(LoginRolePanel.UI["Text_name_"..i], "")
        ssr.GUI:Image_loadTexture(LoginRolePanel.UI["Image_icon_"..i], "res/private/login/btn_add.png")
        ssr.GUI:setTouchEnabled(LoginRolePanel.UI["Image_icon_"..i], true)

        if roles[i] then
            ssr.GUI:Text_setString(LoginRolePanel.UI["Text_level_"..i], roles[i].level .. "级")
            ssr.GUI:Text_setString(LoginRolePanel.UI["Text_name_"..i], roles[i].name)
            ssr.GUI:Image_loadTexture(LoginRolePanel.UI["Image_icon_"..i], LoginRolePanel.createJobPath.select[roles[i].job + 1])
            ssr.GUI:setTouchEnabled(LoginRolePanel.UI["Image_icon_"..i], false)
        end
    end
    
end

-- 更新选择角色显示
function LoginRolePanel.UpdateSelectRoleShow(isInit)
    local animID = LoginRolePanel.animLightID 
    local animGID = LoginRolePanel.animGToLID 
    local animPos = LoginRolePanel.animPos

    local roles = ssr.GetRolesData()
    if animID and animGID and animPos then
        ssr.GUI:removeAllChildren(LoginRolePanel.UI["Node_anim"])
        for i = 1, 2 do
            if roles[i] then
                local animIdx = roles[i].job*2 + roles[i].sex + 1
                if LoginRolePanel.index == i then
                    if isInit then
                        ssr.GUI:Effect_Create(LoginRolePanel.UI["Node_anim"], "anim", animPos.x, animPos.y, 0, animID[animIdx])
                    else
                        local animG = ssr.GUI:Effect_Create(LoginRolePanel.UI["Node_anim"], "animG", animPos.x, animPos.y, 0, animGID[animIdx])
                        ssr.GUI:Effect_addOnCompleteEvent(animG, function()
                            ssr.GUI:removeFromParent(animG)
                            ssr.GUI:Effect_Create(LoginRolePanel.UI["Node_anim"], "anim", animPos.x, animPos.y, 0, animID[animIdx])
                        end)
                        
                        local sfx = ssr.GUI:Effect_Create(LoginRolePanel.UI["Node_anim"], "sfx", animPos.x, animPos.y, 0, 4114)
                        ssr.GUI:Effect_addOnCompleteEvent(sfx, function()
                            ssr.GUI:removeFromParent(sfx)
                        end)
                    end 
                end
            end
            ssr.GUI:setVisible(LoginRolePanel.UI["choose_tag_"..i], LoginRolePanel.index == i)
            local path = LoginRolePanel.index == i and "res/private/login/choose_bg.png"  or "res/private/login/normal_bg.png" 
            ssr.GUI:Image_loadTexture(LoginRolePanel.UI["Img_infoBg_"..i], path)
        end
    end
end

-- 创建角色UI
function LoginRolePanel.createRole( parent, defaultJob, defaultSex, isSingleJob, isSingleSex)
    if not parent then
        return
    end

    local screenW = ssr.getWinWidth()
    local screenH = ssr.getWinHeight()

    -- Panel_role 不可删
    local offsetY = (screenH - 640)/2
    local Panel_role  = ssr.GUI:Layout_Create(parent, "Panel_role", screenW/2, screenH/2, screenW, screenH)
    ssr.GUI:setAnchorPoint(Panel_role, 0.5, 0.5)
    ssr.GUI:setTouchEnabled(Panel_role, false)

    local Panel_anim = ssr.GUI:Layout_Create(Panel_role, "Panel_anim", screenW/2, 595 + offsetY , 350, 400)
    ssr.GUI:setAnchorPoint(Panel_anim, {x=0.5, y=1})
    
    local Node_anim = ssr.GUI:Node_Create(Panel_anim, "Node_anim", 175, 0)
    
    local Panel_info = ssr.GUI:Layout_Create(Panel_role, "Panel_info", screenW/2 - 100, 230, 381, 388)
    ssr.GUI:setAnchorPoint(Panel_info, {x=1, y=0})

    local Image_2 = ssr.GUI:Image_Create(Panel_info, "Image_2", 190, 194, "res/private/login/bg_cjzy_06.png")
    ssr.GUI:setAnchorPoint(Image_2, {x=0.5, y=0.5})

    local Button_close = ssr.GUI:Button_Create(Panel_info, "Button_close", 315, 352, "res/private/login/close_1.png")
    ssr.GUI:setAnchorPoint(Button_close, 0.5, 0.5)
    ssr.GUI:Button_loadTexturePressed(Button_close, "res/private/login/close_2.png")

    -- 角色名字标题
    local Image_7 = ssr.GUI:Image_Create(Panel_info, "Image_7", 234, 311, "res/private/login/word_cjzy_01.png")
    ssr.GUI:setAnchorPoint(Image_7, 0.5, 0.5)

    local Image_8 = ssr.GUI:Image_Create(Panel_info, "Image_8", 229, 273, "res/private/login/bg_cjzy_00.png")
    ssr.GUI:setAnchorPoint(Image_8, 0.5, 0.5)

    -- 昵称输入框 不可删
    local TextInput_name = ssr.GUI:TextInput_Create(Panel_info, "TextInput_name", 223, 273, 140, 28, 20)
    ssr.GUI:setAnchorPoint(TextInput_name, 0.5, 0.5)
    ssr.GUI:TextInput_setFontColor(TextInput_name, "#FFFFFF")
    ssr.GUI:TextInput_setString(TextInput_name, "玩家名字")
    ssr.GUI:TextInput_setMaxLength(TextInput_name, 7)
    
    -- 随机名字 不可删
    local Button_rand = ssr.GUI:Button_Create(Panel_info, "Button_rand", 309, 273, "res/private/login/btn_cjzy_03.png")
    ssr.GUI:setAnchorPoint(Button_rand, 0.5, 0.5)
    ssr.GUI:Button_loadTexturePressed(Button_rand, "res/private/login/btn_cjzy_03_1.png")


    local Button_job_1 = ssr.GUI:Button_Create(Panel_info, "Button_job_1", 95, 274, "res/private/login/icon_cjzy_01.png")
    ssr.GUI:setAnchorPoint(Button_job_1, 0.5, 0.5)
    ssr.GUI:Button_loadTextureDisabled(Button_job_1, "res/private/login/icon_cjzy_01_1.png")

    local Button_job_2 = ssr.GUI:Button_Create(Panel_info, "Button_job_2", 95, 170, "res/private/login/icon_cjzy_02.png")
    ssr.GUI:setAnchorPoint(Button_job_2, 0.5, 0.5)
    ssr.GUI:Button_loadTextureDisabled(Button_job_2, "res/private/login/icon_cjzy_02_1.png")

    local Button_job_3 = ssr.GUI:Button_Create(Panel_info, "Button_job_3", 95, 72, "res/private/login/icon_cjzy_03.png")
    ssr.GUI:setAnchorPoint(Button_job_3, 0.5, 0.5)
    ssr.GUI:Button_loadTextureDisabled(Button_job_3, "res/private/login/icon_cjzy_03_1.png")

    local Button_job_4 = ssr.GUI:Button_Create(Panel_info, "Button_job_4", 95, 16, "res/private/login/icon_cjzy_04.png")
    ssr.GUI:setAnchorPoint(Button_job_4, 0.5, 0.5)
    ssr.GUI:Button_loadTexturePressed(Button_job_4, "res/private/login/icon_cjzy_04.png")
    ssr.GUI:setVisible(Button_job_4, false)

    -- 选择性别标题
    local Image_7_0_0 = ssr.GUI:Image_Create(Panel_info, "Image_7_0_0", 234, 213, "res/private/login/word_cjzy_03.png")
    ssr.GUI:setAnchorPoint(Image_7_0_0, 0.5, 0.5)

    local Button_sex_1 = ssr.GUI:Button_Create(Panel_info, "Button_sex_1", 195, 165, "res/private/login/icon_cjzy_06.png")
    ssr.GUI:setAnchorPoint(Button_sex_1, 0.5, 0.5)
    ssr.GUI:Button_loadTextureDisabled(Button_sex_1, "res/private/login/icon_cjzy_06_1.png")

    local Button_sex_2 = ssr.GUI:Button_Create(Panel_info, "Button_sex_2", 270, 165, "res/private/login/icon_cjzy_05.png")
    ssr.GUI:setAnchorPoint(Button_sex_2, 0.5, 0.5)
    ssr.GUI:Button_loadTextureDisabled(Button_sex_2, "res/private/login/icon_cjzy_05_1.png")

    local Text_sex_1 = ssr.GUI:Text_Create(Panel_info, "Text_sex_1", 195, 121, 20, "#FFFFFF", "男")
    ssr.GUI:setAnchorPoint(Text_sex_1, 0.5, 0.5)

    local Text_sex_2 = ssr.GUI:Text_Create(Panel_info, "Text_sex_2", 272, 121, 20, "#FFFFFF", "女")
    ssr.GUI:setAnchorPoint(Text_sex_2, 0.5, 0.5)

    -- 提交按钮 不可删
    local Button_submit = ssr.GUI:Button_Create(Panel_info, "Button_submit", 234, 62, "res/private/login/btn_fhyx_01.png")
    ssr.GUI:setAnchorPoint(Button_submit, 0.5, 0.5)
    ssr.GUI:Button_loadTexturePressed(Button_submit, "res/private/login/btn_fhyx_01_1.png")
    ssr.GUI:Button_setTitleColor(Button_submit, "#FFFFFF")
    ssr.GUI:Button_setTitleFontSize(Button_submit, 18)
    ssr.GUI:Button_setTitleText(Button_submit, "确认创建")

    -- 显示刷新/功能添加
    ssr.GUI:setVisible(LoginRolePanel.UI.Node_anim, false)

    local createJob = -1
    local createSex = -1

    local function updateAnim()
        -- 创建角色展示动画
        local pos = LoginRolePanel.animPos
        local animID = LoginRolePanel.animLightID
        ssr.GUI:removeAllChildren(Node_anim)
        local animIdx = createJob*2 + createSex + 1
        local anim = ssr.GUI:Effect_Create(Node_anim, "createAnim", pos.x, pos.y, 0, animID[animIdx])
        ssr.GUI:stopAllActions(Node_anim)
        ssr.GUI:setOpacity(Node_anim, 0)
        ssr.GUI:runAction(Node_anim, cc.FadeIn:create(0.3))
    end

    local function selectJob(job)
        createJob = job
        -- 设置创角选择职业
        LoginRolePanel.SelectCreateJob(job)
        local normalPath = LoginRolePanel.createJobPath.normal
        local selectPath = LoginRolePanel.createJobPath.select

        local path = createJob == 0 and selectPath[1] or normalPath[1]
        ssr.GUI:Button_loadTextureNormal(Button_job_1, path)
        local path = createJob == 1 and selectPath[2] or normalPath[2]
        ssr.GUI:Button_loadTextureNormal(Button_job_2, path)
        local path = createJob == 2 and selectPath[3] or normalPath[3]
        ssr.GUI:Button_loadTextureNormal(Button_job_3, path)
    end
    
    local function selectSex(sex)
        createSex = sex
        -- 设置创角选择性别
        LoginRolePanel.SelectCreateSex(sex)
        local normalPath = LoginRolePanel.createSexPath.normal
        local selectPath = LoginRolePanel.createSexPath.select
    
        local path = createSex == 0 and selectPath[1] or normalPath[1]
        ssr.GUI:Button_loadTextureNormal(Button_sex_1, path)
        local path = createSex == 1 and selectPath[2] or normalPath[2]
        ssr.GUI:Button_loadTextureNormal(Button_sex_2, path)
    end

    -- 职业/性别
    ssr.GUI:Button_setZoomScale( Button_job_1, 0 )
    ssr.GUI:addOnClick(Button_job_1, function()
        if createJob == 0 then
            return false
        end
        selectJob(0)
        updateAnim()
    end)

    ssr.GUI:Button_setZoomScale( Button_job_2, 0 )
    ssr.GUI:addOnClick(Button_job_2, function()
        if createJob == 1 then
            return false
        end
        selectJob(1)
        updateAnim()
    end)
    
    ssr.GUI:Button_setZoomScale( Button_job_2, 0 )
    ssr.GUI:addOnClick(Button_job_2, function()
        if createJob == 1 then
            return false
        end
        selectJob(1)
        updateAnim()
    end)

    ssr.GUI:Button_setZoomScale( Button_job_3, 0 )
    ssr.GUI:addOnClick(Button_job_3, function()
        if createJob == 2 then
            return false
        end
        selectJob(2)
        updateAnim()
    end)

    ssr.GUI:Button_setZoomScale( Button_sex_1, 0 )
    ssr.GUI:addOnClick(Button_sex_1, function()
        if createSex == 0 then
            return false
        end
        selectSex(0)
        updateAnim()
    end)
    
    ssr.GUI:Button_setZoomScale( Button_sex_2, 0 )
    ssr.GUI:addOnClick(Button_sex_2, function()
        if createSex == 1 then
            return false
        end
        selectSex(1)
        updateAnim()
    end)

    if defaultJob and defaultSex then
        selectJob(defaultJob)
        selectSex(defaultSex)
        updateAnim()
    end

    -- 单职业处理 
    if isSingleJob then
        ssr.GUI:setPositionY(Button_job_1, 170)
        ssr.GUI:setVisible(Button_job_2, false)
        ssr.GUI:setVisible(Button_job_3, false)
        ssr.GUI:setVisible(Button_job_4, false)
    end

    if isSingleSex then
        if isSingleSex == 0 then
            ssr.GUI:setPositionX(Button_sex_1, 232)
            ssr.GUI:setVisible(Button_sex_2, false)
        elseif isSingleSex == 1 then
            ssr.GUI:setPositionX(Button_sex_2, 232)
            ssr.GUI:setVisible(Button_sex_1, false)
            selectSex(1)
            updateAnim()
        end
    end

    ssr.GUI:addOnClick(Button_close, function ()
        LoginRolePanel.CloseCreateRole()
    end)

    LoginRolePanel._CreateUI = ui_delegate(Panel_role)

end

-- 关闭创角界面
function LoginRolePanel.CloseCreateRole()
    ssr.GUI:removeFromParent(LoginRolePanel._CreateUI.nativeUI)
    LoginRolePanel._CreateUI = nil
    ssr.GUI:setVisible(LoginRolePanel.UI.Node_anim, true)

    LoginRolePanel.HideCreateRole()
end

function LoginRolePanel.createRestore( parent )
    if not parent then
        return
    end

    local screenW = ssr.getWinWidth()
    local screenH = ssr.getWinHeight()

    local Panel_1 = ssr.GUI:Layout_Create(parent, "Panel_1", screenW/2, 230, 350, 360)
    ssr.GUI:setAnchorPoint(Panel_1, 0.5, 0)
    ssr.GUI:Layout_setBackGroundColor(Panel_1, "#4D4D4D")
    ssr.GUI:Layout_setBackGroundColorType(Panel_1, 1)
    ssr.GUI:Layout_setBackGroundColorOpacity(Panel_1, 102)

    local Text_1 = ssr.GUI:Text_Create(Panel_1, "Text_1", 80, 340, 20, "#FFFFFF", "角色名字")
    ssr.GUI:setAnchorPoint(Text_1, 0.5, 0.5)

    local Text_1_0 = ssr.GUI:Text_Create(Panel_1, "Text_1_0", 200, 340, 20, "#FFFFFF", "等级")
    ssr.GUI:setAnchorPoint(Text_1_0, 0.5, 0.5)

    local ListView_1 = ssr.GUI:ListView_Create(Panel_1, "ListView_1", 19, 12, 300, 300, 1)
    ssr.GUI:setAnchorPoint(ListView_1, 0, 0)
    ssr.GUI:ListView_setItemsMargin(ListView_1, 8)
    ssr.GUI:ListView_setClippingEnabled(ListView_1, true)

    local restore_cell = ssr.GUI:Layout_Create(Panel_1, "restore_cell", 0, 0, 300, 30)
    ssr.GUI:setVisible(restore_cell, false)
    ssr.GUI:Layout_setBackGroundColor(restore_cell, "#8B6914")
    ssr.GUI:Layout_setBackGroundColorType(restore_cell, 1)
    ssr.GUI:Layout_setBackGroundColorOpacity(restore_cell, 102)

    local Text_name = ssr.GUI:Text_Create(restore_cell, "Text_name", 15, 15, 20, "#FFFFFF", "-")
    ssr.GUI:setAnchorPoint(Text_name, 0, 0.5)

    local Text_level = ssr.GUI:Text_Create(restore_cell, "Text_level", 170, 15, 20, "#FFFFFF", "-")
    ssr.GUI:setAnchorPoint(Text_level, 0, 0.5)

    local btn_restore = ssr.GUI:Button_Create(restore_cell, "btn_restore", 255, 15, "Default/Button_Normal.png")
    ssr.GUI:setAnchorPoint(btn_restore, 0.5, 0.5)
    ssr.GUI:setContentSize(btn_restore, {width = 80, height = 28})
    ssr.GUI:Button_setTitleColor(btn_restore, "#f8e6c6")
    ssr.GUI:Button_setTitleFontSize(btn_restore, 18)
    ssr.GUI:Button_setTitleText(btn_restore, "恢复角色")
    ssr.GUI:Button_titleEnableOutline(btn_restore, "#111111", 2)
    ssr.GUI:Button_setScale9Slice(btn_restore, 15, 49, 11, 3)


    local Button_close = ssr.GUI:Button_Create(Panel_1, "Button_close", 330, 340, "res/public/btn_normal_2.png")
    ssr.GUI:setAnchorPoint(Button_close, 0.5, 0.5)
    ssr.GUI:Button_loadTexturePressed(Button_close, "res/public/btn_pressed_2.png")
    ssr.GUI:addOnClick(Button_close, function ()
        if LoginRolePanel._RestoreUI then
            ssr.GUI:removeFromParent(LoginRolePanel._RestoreUI.nativeUI)
        end
        LoginRolePanel._RestoreUI = nil
        LoginRolePanel.HideRestoreList()
    end)

    LoginRolePanel._RestoreUI = ssr.UIQuickChild(Panel_1)
end