

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if arg1 == 'zBar' then
            for _, v in pairs({zBar1, zBar2, zBar3, zBar4, zBar9}) do
                for i = 1, 12 do
                    local bu = _G[v..'Button'..i]
                    if bu then
                        modSkin(bu, 16)
                        modSkinPadding(bu, 2)
                        modSkinColor(bu, .2, .2, .2)
                    end
                end
            end
        end
    end)

    --
