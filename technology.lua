local base_trees = DECOCRAFT.CONFIG.BASE_TREES
local craftable_trees = DECOCRAFT.CONFIG.CRAFTABLE_TREES
local craftable_alive_trees = DECOCRAFT.CONFIG.CRAFTABLE_ALIVE_TREES
local base_rocks = DECOCRAFT.CONFIG.BASE_ROCKS

local utils = require("utils")

-- general research
local landscaping_effects = {}

local function add_to_landscaping_effects(array, type)
    for _, item in pairs(array) do
        if data.raw[type][item] then
            table.insert(landscaping_effects, {
                type = "unlock-recipe",
                recipe = "decocraft-base-" .. item
            })
        end
    end
end

-- add all nauvis trees to the base research
-- for _, tree in pairs(craftable_trees["nauvis"]) do
--     if data.raw["tree"][tree] then
--         table.insert(landscaping_effects, {
--             type = "unlock-recipe",
--             recipe = "decocraft-base-" .. tree
--         })
--     end
-- end

add_to_landscaping_effects(craftable_trees["nauvis"], "tree")

-- add all other trees to the base research
if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then
    -- for _, tree in pairs(base_trees) do
    --     if data.raw["tree"][tree] then
    --         table.insert(landscaping_effects, {
    --             type = "unlock-recipe",
    --             recipe = "decocraft-base-" .. tree
    --         })
    --     end
    -- end
    add_to_landscaping_effects(base_trees, "tree")
end

-- add all nauvis rocks to the base research
-- for _, rock in pairs(base_rocks["nauvis"]) do
--     if data.raw["simple-entity"][rock] then
--         table.insert(landscaping_effects, {
--             type = "unlock-recipe",
--             recipe = "decocraft-base-" .. rock
--         })
--     end
-- end

add_to_landscaping_effects(base_rocks["nauvis"], "simple-entity")

-- Base research
data:extend({
    {
        type = "technology",
        name = "decocraft-landscaping",
        icon = data.raw["item-group"]["environment"].icon,
        icon_size = 128,
        prerequisites = {
            "landfill"
        },
        icon_mipmaps = 1,
        unit = {
            count = 50,
            ingredients = {
                {
                    "automation-science-pack",
                    1
                },
                {
                    "logistic-science-pack",
                    1
                }
            },
            time = 10
        },
        -- research_trigger = "dect-landscaping",
        effects = landscaping_effects,
        order = "a"
    }

})

-- ? planet specific research only if space-age is enabled
if not mods["space-age"] then
    return
end

-- function to create effects for each planet in a given array (rocks, trees, etc.)
local function create_planet_effects(array, type)
    local effects = {}
    for _, item in pairs(array) do
        if data.raw[type][item] then
            table.insert(effects, {
                type = "unlock-recipe",
                recipe = "decocraft-base-" .. item
            })
        end
    end
    return effects
end

-- function to create icons for each planets landscaping technology 
local function create_planet_landscaping_technology_icon(planet, icon1, icon2)
    local icons = {
        {
            icon = '__space-age__/graphics/technology/' .. planet .. '.png',
            icon_size = 256,
            scale = 0.6
        },
        {
            icon = icon1,
            icon_size = 64,
            scale = 1,
            shift = {
                63,
                63
            }
        },
        {
            icon = icon2,
            icon_size = 64,
            scale = 1,
            shift = {
                -63,
                63
            }
        }

    }
    return icons
end

local function create_planet_landscaping_technology(planet, research_trigger, icon1, icon2)

    local effects = base_rocks[planet] and create_planet_effects(base_rocks[planet], "simple-entity") or {}
    local alive_tree_effects = craftable_alive_trees[planet] and
                                   create_planet_effects(craftable_alive_trees[planet], "tree") or {}
    local tree_effects = craftable_trees[planet] and create_planet_effects(craftable_trees[planet], "tree") or {}

    for _, effect in pairs(alive_tree_effects) do
        table.insert(effects, effect)
    end

    for _, effect in pairs(tree_effects) do
        table.insert(effects, effect)
    end

    data:extend({
        {
            type = "technology",
            name = "decocraft-" .. planet .. "-landscaping",

            icons = create_planet_landscaping_technology_icon(planet, icon1, icon2),

            icon_size = 256,
            prerequisites = {
                "decocraft-landscaping"
            },
            icon_mipmaps = 1,
            research_trigger = research_trigger,

            effects = effects,
            order = "a"
        }
    })
end

create_planet_landscaping_technology("vulcanus", {
    type = "mine-entity",
    entity = "big-volcanic-rock"
}, data.raw["tree"]["ashland-lichen-tree-flaming"].icon, data.raw["simple-entity"]["vulcanus-chimney"].icon)

create_planet_landscaping_technology("fulgora", {
    type = "mine-entity",
    entity = "fulgoran-ruin-vault"
}, data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].icon, data.raw["simple-entity"]["big-fulgora-rock"].icon)

create_planet_landscaping_technology("gleba", {
    type = "mine-entity",
    entity = "iron-stromatolite"
}, data.raw["tree"]["sunnycomb"].icon, data.raw["simple-entity"]["iron-stromatolite"].icon)

create_planet_landscaping_technology("aquilo", {
    type = "mine-entity",
    entity = "lithium-iceberg-big"
}, data.raw["simple-entity"]["lithium-iceberg-big"].icon, data.raw["simple-entity"]["lithium-iceberg-huge"].icon)

