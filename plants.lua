local seconds = 60
local minutes = 60 * seconds

local plant_flags = {
    "placeable-neutral",
    "placeable-off-grid",
    "breaths-air"
}

-- add pine seeds to the game
-- local pine_tree_plant = util.table.deepcopy(data.raw["tree"]["tree-01"])
-- pine_tree_plant.type = "plant"
-- pine_tree_plant.name = "pine-tree-plant"
-- pine_tree_plant.localised_name = {
--     "entity-name.pine-tree-plant"
-- }
-- pine_tree_plant.flags = plant_flags
-- pine_tree_plant.hidden_in_factoriopedia = false
-- pine_tree_plant.factoriopedia_alternative = nil
-- pine_tree_plant.map_color = {
--     0.19,
--     0.39,
--     0.19,
--     0.40
-- }
-- pine_tree_plant.agricultural_tower_tint = {
--     primary = {
--         r = 0.7,
--         g = 1.0,
--         b = 0.2,
--         a = 1
--     },
--     secondary = {
--         r = 0.561,
--         g = 0.613,
--         b = 0.308,
--         a = 1.000
--     } -- #8f4f4eff
-- }
-- pine_tree_plant.minable = {
--     mining_particle = "wooden-particle",
--     mining_time = 0.5,
--     results = {
--         {
--             type = "item",
--             name = "wood",
--             amount = 4
--         }
--     }
-- }
-- pine_tree_plant.variation_weights = {
--     1,
--     1,
--     1,
--     1,
--     1,
--     1,
--     1,
--     1,
--     0.3,
--     0.3,
--     0.0,
--     0.0
-- }
-- pine_tree_plant.growth_ticks = 10 * minutes
-- pine_tree_plant.surface_conditions = {
--     {
--         property = "pressure",
--         min = 1000,
--         max = 1000
--     }
-- } -- only Nauvis (doesn't work yet)
-- pine_tree_plant.autoplace = {
--     probability_expression = 0,
--     -- required to show agricultural tower plots
--     tile_restriction = {
--         "grass-1",
--         "grass-2",
--         "grass-3",
--         "grass-4",
--         "dry-dirt",
--         "dirt-1",
--         "dirt-2",
--         "dirt-3",
--         "dirt-4",
--         "dirt-5",
--         "dirt-6",
--         "dirt-7",
--         "red-desert-0",
--         "red-desert-1",
--         "red-desert-2",
--         "red-desert-3"
--     }
-- }

-- pine_tree_plant.minable.results = {
--     {
--         type = "item",
--         name = "pine-wood",
--         amount = 4
--     }
-- }

local function create_tree_plant(name, source_tree)
    local tree_plant = util.table.deepcopy(data.raw["tree"][source_tree])
    tree_plant.type = "plant"
    tree_plant.name = name .. "-tree-plant"
    tree_plant.localised_name = {
        "entity-name." .. name .. "-tree-plant"
    }
    tree_plant.flags = plant_flags
    tree_plant.hidden_in_factoriopedia = false
    tree_plant.factoriopedia_alternative = nil

    tree_plant.map_color = data.raw["plant"]["tree-plant"].map_color

    tree_plant.agricultural_tower_tint = data.raw["plant"]["tree-plant"].agricultural_tower_tint

    tree_plant.minable = data.raw["plant"]["tree-plant"].minable

    tree_plant.variation_weights = data.raw["plant"]["tree-plant"].variation_weights
    tree_plant.growth_ticks = 10 * minutes
    tree_plant.surface_conditions = {
        {
            property = "pressure",
            min = 1000,
            max = 2000
        }
    } -- ! only Nauvis and Gleba

    tree_plant.autoplace = data.raw["plant"]["tree-plant"].autoplace
    tree_plant.minable.results = {
        {
            type = "item",
            name = name .. "-wood",
            amount = 4
        }
    }
    return tree_plant
end

local function create_custom_wood(name)
    local wood = util.table.deepcopy(data.raw["item"]["wood"])
    wood.name = name .. "-wood"
    -- wood.localised_name = {
    --     "item-name." .. name .. "-wood"
    -- }
    wood.icon = "__DecoCraft__/graphics/icons/" .. name .. "-wood.png"
    wood.icon_size = 64
    wood.icon_mipmaps = 4
    wood.picture = {
        filename = "__DecoCraft__/graphics/icons/" .. name .. "-wood.png",
        scale = 0.5,
        mipmap_count = 4
    }
    return wood
end

local function create_custom_seeds(tree_name)
    local seeds = util.table.deepcopy(data.raw["item"]["tree-seed"])
    seeds.name = tree_name .. "-seed"
    seeds.localised_name = {
        "item-name." .. tree_name .. "-seed"
    }
    seeds.icon = "__DecoCraft__/graphics/icons/" .. tree_name .. "-seed.png"
    seeds.picture = {
        size = 64,
        filename = "__DecoCraft__/graphics/icons/" .. tree_name .. "-seed-1.png",
        scale = 0.5,
        mipmap_count = 4
    }
    seeds.plant_result = tree_name .. "-tree-plant"
    seeds.place_result = tree_name .. "-tree-plant"
    return seeds
end

local function create_custom_wood_processing(name)
    local wood_processing = util.table.deepcopy(data.raw["recipe"]["wood-processing"])
    wood_processing.name = name .. "-wood-processing"
    wood_processing.enabled = true
    wood_processing.icon = data.raw["tree"]["tree-01"].icon
    wood_processing.icon_size = 64
    wood_processing.icon_mipmaps = 4
    wood_processing.ingredients = {
        {
            type = "item",
            name = name .. "-wood",
            amount = 2
        }
    }
    wood_processing.results = {
        {
            type = "item",
            name = name .. "-seed",
            amount = 1
        }
    }
    return wood_processing
end

local pine_tree_plant = create_tree_plant("pine", "tree-01")
local pine_wood = create_custom_wood("pine")
local pine_seeds = create_custom_seeds("pine")
local pine_wood_processing = create_custom_wood_processing("pine")

-- add pine wood to the game
-- local pine_wood = util.table.deepcopy(data.raw["item"]["wood"])
-- pine_wood.name = "pine-wood"
-- pine_wood.localised_name = {
--     "item-name.pine-wood"
-- }
-- pine_wood.icon = "__DecoCraft__/graphics/icons/pine-wood.png"
-- pine_wood.icon_size = 64
-- pine_wood.icon_mipmaps = 4
-- pine_wood.picture = {
--     filename = "__DecoCraft__/graphics/icons/pine-wood.png",
--     scale = 0.5,
--     mipmap_count = 4
-- }
-- pine_wood.localised_name = {
--     "Pine Wood"
-- }

-- add pine seeds to the game
-- local pine_seeds = util.table.deepcopy(data.raw["item"]["tree-seed"])
-- pine_seeds.name = "pine-seed"
-- pine_seeds.localised_name = {
--     "item-name.pine-seed"
-- }
-- pine_seeds.icon = "__DecoCraft__/graphics/icons/pine-seed.png"
-- pine_seeds.picture = {
--     size = 64,
--     filename = "__DecoCraft__/graphics/icons/pine-seed-1.png",
--     scale = 0.5,
--     mipmap_count = 4

-- }

-- pine_seeds.plant_result = "pine-tree-plant"
-- pine_seeds.place_result = "pine-tree-plant"

-- add pine-wood-processing to the game
-- local pine_wood_processing = util.table.deepcopy(data.raw["recipe"]["wood-processing"])
-- pine_wood_processing.name = "pine-wood-processing"
-- pine_wood_processing.enabled = true
-- pine_wood_processing.icon = data.raw["tree"]["tree-01"].icon
-- pine_wood_processing.icon_size = 64
-- pine_wood_processing.icon_mipmaps = 4
-- -- pine_wood_processing.localised_name = {
-- --     "Pine Wood Processing"
-- -- }
-- pine_wood_processing.ingredients = {
--     {
--         type = "item",
--         name = "pine-wood",
--         amount = 2
--     }
-- }

-- pine_wood_processing.results = {
--     {
--         type = "item",
--         name = "pine-seed",
--         amount = 1
--     }
-- }

data:extend({
    pine_tree_plant,
    pine_seeds,
    pine_wood,
    pine_wood_processing
})

-- for _, tree in pairs(craftable_trees) do
--     data:extend({
--         {
--             type = "recipe",
--             name = "decocraft-base-" .. tree,
--             energy_required = 2,
--             -- enabled = false,
--             enabled = true,
--             category = "crafting",
--             ingredients = entity_ingredients(tree, "tree"),
--             results = {
--                 {
--                     type = "item",
--                     name = "decocraft-base-" .. tree,
--                     amount = 1
--                 }
--             }
--         }
--     })
-- end

-- for _, tree in pairs(craftable_trees) do
--     data:extend({
--         {
--             type = "item",
--             name = "decocraft-base-" .. tree,
--             icon = data.raw["tree"][tree].icon,
--             icon_size = 64,
--             icon_mipmaps = 4,
--             group = "Environment",
--             subgroup = "trees",
--             order = "c[base-" .. tree .. "]",
--             stack_size = 10,
--             place_result = tree,
--             localised_name = {
--                 "entity-name." .. tree
--             }
--         }
--     })
-- end
