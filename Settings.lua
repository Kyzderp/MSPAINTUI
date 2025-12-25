local MSP = MSPAINTUI

local function CreateSettingsMenu()
    local LAM = LibAddonMenu2
    local panelData = {
        type = "panel",
        name = "|c08BD1DMSPAINTUI|r",
        author = "Kyzeragon, BirdSalad, Eashi, Thepinja",
        version = MSP.version,
        registerForRefresh = true,
        registerForDefaults = true,
    }

    local optionsData = {
        {
            type = "checkbox",
            name = "Change UI textures",
            tooltip = "Use Paint textures for some UI elements",
            default = true,
            getFunc = function()
                return MSP.savedOptions.enable.ui
            end,
            setFunc = function(value)
                MSP.savedOptions.enable.ui = value
            end,
            width = "full",
        },
    }

    LAM:RegisterAddonPanel("MSPAINTUIOptions", panelData)
    LAM:RegisterOptionControls("MSPAINTUIOptions", optionsData)
end
MSP.CreateSettingsMenu = CreateSettingsMenu
