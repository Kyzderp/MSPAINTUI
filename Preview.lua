local MSP = MSPAINTUI

local panel

local function PreviewIcons()
    if (panel) then
        panel:SetHidden(false)
        return
    end

    panel = WINDOW_MANAGER:CreateTopLevelWindow(MSP.name .. "PreviewPanel")
    panel:SetAnchor(TOP, GuiRoot, TOP, 0, 32)
    panel:SetWidth(GuiRoot:GetWidth() * 0.9)
    panel:SetHeight(GuiRoot:GetHeight() * 0.9)
    panel:SetMouseEnabled(true)

    local backdrop = WINDOW_MANAGER:CreateControl("$(parent)Backdrop", panel, CT_BACKDROP)
    backdrop:SetAnchorFill()
    backdrop:SetCenterColor(0, 0, 0, 0.9)

    local closeButton = WINDOW_MANAGER:CreateControl("$(parent)Close", panel, CT_BUTTON)
    ApplyTemplateToControl(closeButton, "ZO_DefaultButton")
    closeButton:SetText("Close")
    closeButton:SetHandler("OnClicked", function() panel:SetHidden(true) end)
    closeButton:SetAnchor(CENTER, panel, TOP, 0, 32)

    local optionsOrder = {
        "Dragonknight",
        "Sorcerer",
        "Nightblade",
        "Templar",
        "Warden",
        "Necromancer",
        "Arcanist",
        "Weapon",
        "Armor",
        "World",
        "Guild",
        "Alliance War",
    }

    local NUM_PER_ROW = 34
    local numRows = 1
    for groupIndex, groupName in ipairs(optionsOrder) do
        local groupTable = MSP.ABILITY_ICONS[groupName]
        for iconIndex, iconPath in ipairs(groupTable) do
            local texture = WINDOW_MANAGER:CreateControl("$(parent)" .. iconPath, panel, CT_TEXTURE)
            texture:SetDimensions(64, 64)
            texture:SetAnchor(TOPLEFT, panel, TOPLEFT, ((iconIndex - 1) % NUM_PER_ROW) * 67 + 16, (numRows + math.floor((iconIndex - 1) / NUM_PER_ROW)) * 67)
            texture:SetTexture("MSPAINTUI/art/abilities/" .. iconPath)
        end
        numRows = numRows + math.ceil(#groupTable / NUM_PER_ROW)
    end
end
MSP.PreviewIcons = PreviewIcons
-- /script MSPAINTUI.PreviewIcons()
