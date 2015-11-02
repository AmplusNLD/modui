

    local AttachToMainbar = true    -- REPARENT TIP TO MAINMENUBAR. true/false
    local sb = [[Interface\AddOns\modui\modsb\texture\sb.tga]]
    local GameTooltip = GameTooltip
    local GameTooltipStatusBar = GameTooltipStatusBar

    GameTooltipStatusBar:SetHeight(4)
    GameTooltipStatusBar:SetStatusBarTexture(sb)
    GameTooltipStatusBar:SetBackdrop({  bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
                                        insets = {left = -1, right = -1, top = -1, bottom = -1} })
    GameTooltipStatusBar:SetBackdropColor(0, 0, 0, 1)

    GameTooltipHeaderText:SetFont(STANDARD_TEXT_FONT, 13)
    GameTooltipHeaderText:SetShadowOffset(.7, -.7)
    GameTooltipHeaderText:SetShadowColor(0, 0, 0, 1)
    GameTooltipText:SetFont(STANDARD_TEXT_FONT, 12)
    GameTooltipText:SetShadowOffset(.7, -.7)
    GameTooltipText:SetShadowColor(0, 0, 0,1)


    local tooltips = {  GameTooltip,
                        ItemRefTooltip,
                        ItemRefShoppingTooltip1,
                     	ItemRefShoppingTooltip2,
                        ItemRefShoppingTooltip3,
                        ShoppingTooltip1,
                        ShoppingTooltip2,
                        ShoppingTooltip3,
                        WorldMapTooltip,
                        WorldMapCompareTooltip1,
                        WorldMapCompareTooltip2,
                        WorldMapCompareTooltip3,
                        FriendsTooltip, }

    local menus =    {  DropDownList1MenuBackdrop,
                        DropDownList2MenuBackdrop,
                        DropDownList3MenuBackdrop,
                        ChatMenu,
                        EmoteMenu,
                        LanguageMenu, }

    local modTipOnShow = function()
        local type = GameTooltip:GetAnchorType()
        GameTooltip:SetBackdropColor(0, 0, 0, .7)
        GameTooltip:SetBackdropBorderColor(.1, .1, .1, 1)
        if AttachToMainbar and type == 'ANCHOR_NONE' then
            GameTooltip:ClearAllPoints()
            GameTooltip:SetPoint('BOTTOMRIGHT', MainMenuBar, -6, CONTAINER_OFFSET_Y + 16)
        end
    end

    local t = CreateFrame('Frame', nil, GameTooltip) t:SetAllPoints()
    t:SetScript('OnShow', modTipOnShow)
    for i, v in ipairs(menus) do v:SetScript('OnShow', function()
            this:SetBackdropColor(0, 0, 0, .4)
            this:SetBackdropBorderColor(.1, .1, .1, 1)
        end)
    end


    for i = 1, 6 do                 -- QUEST PROGRESS TOOLTIP
        local p = _G['QuestProgressItem'..i]
        p:SetScript('OnEnter', function()
            if GameTooltip then
                GameTooltip:SetOwner(p, 'ANCHOR_RIGHT')
                if GetNumQuestItems() > 0 then GameTooltip:SetQuestItem(p.type, p:GetID()) end
            end
        end)
    end


    local f = CreateFrame'Frame'    -- GUILD TAG
    f:RegisterEvent'UPDATE_MOUSEOVER_UNIT'
    f:SetScript('OnEvent', function()
        local g = GetGuildInfo'mouseover'
        if g then GameTooltip:AddLine('<'..g..'>', 0, 1, .5) GameTooltip:Show() end
    end)

    --
