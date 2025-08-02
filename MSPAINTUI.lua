MSPAINTUI = MSPAINTUI or {}
local MSP = MSPAINTUI
MSP.name = "MSPAINTUI"
MSP.version = "0.0.0"

---------------------------------------------------------------------
-- Initialize
---------------------------------------------------------------------
local function Initialize()
    MSP.RedirectAbilityTextures()

    RedirectTexture("/esoui/art/actionbar/abilityframe64_up.dds", "MSPAINTUI/art/ui/abilityframe64_up.dds")
    RedirectTexture("/esoui/art/actionbar/passiveabilityframe_round_up.dds", "MSPAINTUI/art/ui/passiveabilityframe_round_up.dds")
    RedirectTexture("/esoui/art/progression/addpoints_up.dds", "MSPAINTUI/art/ui/addpoints_up.dds")
    RedirectTexture("/esoui/art/progression/morph_up.dds", "MSPAINTUI/art/ui/morph_up.dds")
    RedirectTexture("/esoui/art/progression/skillstyling_default_up.dds", "MSPAINTUI/art/ui/skillstyling_default_up.dds")
    RedirectTexture("/esoui/art/miscellaneous/progressbar_frame.dds", "MSPAINTUI/art/ui/progressbar_frame.dds")
    RedirectTexture("/esoui/art/miscellaneous/scrollbox_elevator.dds", "MSPAINTUI/art/ui/scrollbox_elevator.dds")
    RedirectTexture("/esoui/art/unitattributevisualizer/attributebar_dynamic_frame.dds", "MSPAINTUI/art/ui/attributebar_dynamic_frame.dds")
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

