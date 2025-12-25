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
            type = "description",
            text = "Note: You will likely need to fully restart your game (not just reload!) in order to see changes reflected, when you turn off some options.",
            width = "full",
        },
        {
            type = "checkbox",
            name = "UI textures",
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

    for _, category in ipairs(optionsOrder) do
        table.insert(optionsData, {
            type = "checkbox",
            name = category,
            tooltip = "Use Paint textures for " .. category .. " icons",
            default = true,
            getFunc = function()
                return MSP.savedOptions.enable[category]
            end,
            setFunc = function(value)
                MSP.savedOptions.enable[category] = value
            end,
            width = "full",
        })
    end

    table.insert(optionsData, {
        type = "description",
        text = [[Credits:
@Kyzeragon - Coding + Compilation, UI, Herald of the Tome, Assassination, Shadow
@BirdSalad - Grave Lord, Dawn's Wrath, Dual Wield, Ardent Flame, Support, Restoring Light, Resolving Vigor, Bone Tyrant, Animal Companions
@Eashi - Destruction Staff, Trample, Psijic Order
@Thepinja - Daedric Summoning, Storm Calling, Dark Magic, Armor
@Plonkerr - Werewolf
@SpookaSpooka - Vampire
@camrenis - Aedric Spear
@QueuesAsTanks - Fighters Guild
@M0R_Gaming - Winter's Embrace
@SuddenGhost24 - War Horn & morphs
]],
        width = "full",
    })

    LAM:RegisterAddonPanel("MSPAINTUIOptions", panelData)
    LAM:RegisterOptionControls("MSPAINTUIOptions", optionsData)
end
MSP.CreateSettingsMenu = CreateSettingsMenu
