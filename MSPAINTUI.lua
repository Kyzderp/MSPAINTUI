MSPAINTUI = {
    name = "MSPAINTUI",
    version = "0.0.0",
}
local MSP = MSPAINTUI

local defaultOptions = {
    enable = {
        ui = true,
        ["Dragonknight"] = true,
        ["Sorcerer"] = true,
        ["Nightblade"] = true,
        ["Templar"] = true,
        ["Warden"] = true,
        ["Necromancer"] = true,
        ["Arcanist"] = true,
        ["Weapon"] = true,
        ["Armor"] = true,
        ["World"] = true,
        ["Guild"] = true,
        ["Alliance War"] = true,
    },
}

---------------------------------------------------------------------
-- Initialize
---------------------------------------------------------------------
local function Initialize()
    MSP.savedOptions = ZO_SavedVars:NewAccountWide("MSPAINTUISavedVariables", 1, "Options", defaultOptions)
    MSP.CreateSettingsMenu()

    MSP.RedirectAbilityTextures()

    if (MSP.savedOptions.enable.ui) then
        RedirectTexture("/esoui/art/actionbar/abilityframe64_up.dds", "MSPAINTUI/art/ui/abilityframe64_up.dds")
        RedirectTexture("/esoui/art/actionbar/passiveabilityframe_round_up.dds", "MSPAINTUI/art/ui/passiveabilityframe_round_up.dds")
        RedirectTexture("/esoui/art/progression/addpoints_up.dds", "MSPAINTUI/art/ui/addpoints_up.dds")
        RedirectTexture("/esoui/art/progression/morph_up.dds", "MSPAINTUI/art/ui/morph_up.dds")
        RedirectTexture("/esoui/art/progression/skillstyling_default_up.dds", "MSPAINTUI/art/ui/skillstyling_default_up.dds")
        RedirectTexture("/esoui/art/miscellaneous/progressbar_frame.dds", "MSPAINTUI/art/ui/progressbar_frame.dds")
        RedirectTexture("/esoui/art/miscellaneous/scrollbox_elevator.dds", "MSPAINTUI/art/ui/scrollbox_elevator.dds")
        -- RedirectTexture("/esoui/art/unitattributevisualizer/attributebar_dynamic_frame.dds", "MSPAINTUI/art/ui/attributebar_dynamic_frame.dds")
    end
end


---------------------------------------------------------------------
-- On load
local function OnAddOnLoaded(_, addonName)
    if (addonName == MSP.name) then
        EVENT_MANAGER:UnregisterForEvent(MSP.name, EVENT_ADD_ON_LOADED)
        Initialize()
    end
end
 
EVENT_MANAGER:RegisterForEvent(MSP.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)

