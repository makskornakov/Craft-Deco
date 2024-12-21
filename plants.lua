local seconds = 60
local minutes = 60 * seconds

local plant_flags = {
    "placeable-neutral",
    "placeable-off-grid",
    "breaths-air"
}

local function create_tree_plant(name, source_tree, variation_weights, agricultural_tower_tint)
    local tree_plant = util.table.deepcopy(data.raw["tree"][source_tree])

    -- tree_plant.hidden_in_factoriopedia = false
    -- tree_plant.factoriopedia_alternative = data.raw["tree"]["tree-02"].name

    tree_plant.type = "plant"
    tree_plant.name = name .. "-tree-plant"
    tree_plant.localised_name = {
        "plant-name." .. name .. "-tree-plant"
    }
    tree_plant.flags = plant_flags

    tree_plant.map_color = data.raw["plant"]["tree-plant"].map_color
    tree_plant.agricultural_tower_tint = agricultural_tower_tint or
                                             data.raw["plant"]["tree-plant"].agricultural_tower_tint
    tree_plant.autoplace = data.raw["plant"]["tree-plant"].autoplace

    if variation_weights then
        tree_plant.variation_weights = variation_weights
    end
    tree_plant.growth_ticks = 10 * minutes
    tree_plant.surface_conditions = {
        {
            property = "pressure",
            min = 1000,
            max = 2000
        }
    } -- ? only Nauvis and Gleba

    tree_plant.minable = {
        mining_particle = "wooden-particle",
        mining_time = 0.5,
        results = {
            {
                type = "item",
                name = name .. "-wood",
                amount = 4
            }
        }
    }

    local original_tree = data.raw["tree"][source_tree]
    original_tree.minable.results = {
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
    wood.localised_name = {
        "item-name." .. name .. "-wood"
    }
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
    -- seeds.factoriopedia_alternative = nil;
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

local function create_custom_wood_processing(name, source_tree)
    local wood_processing = util.table.deepcopy(data.raw["recipe"]["wood-processing"])
    wood_processing.name = name .. "-wood-processing"
    wood_processing.localised_name = {
        "recipe-name." .. name .. "-wood-processing"
    }
    wood_processing.enabled = false
    wood_processing.icon = data.raw["tree"][source_tree].icon
    wood_processing.icon_size = 64
    wood_processing.icon_mipmaps = 4
    -- wood_processing.hidden_in_factoriopedia = true
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

    -- unlocked by tree-seeding technology
    table.insert(data.raw["technology"]["tree-seeding"].effects, {
        type = "unlock-recipe",
        recipe = name .. "-wood-processing"
    })

    return wood_processing
end

local pine_variations_weights = {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0.0,
    0.0
}

local pine_tree_plant = create_tree_plant("pine", "tree-01", pine_variations_weights)
local pine_wood = create_custom_wood("pine")
local pine_seeds = create_custom_seeds("pine")
local pine_wood_processing = create_custom_wood_processing("pine", "tree-01")

local maple_tree_plant = create_tree_plant("maple", "tree-09-red", nil,
    data.raw["plant"]["yumako-tree"].agricultural_tower_tint)
local maple_wood = create_custom_wood("maple")
local maple_seeds = create_custom_seeds("maple")
local maple_wood_processing = create_custom_wood_processing("maple", "tree-09-red")

data:extend({
    pine_tree_plant,
    pine_seeds,
    pine_wood,
    pine_wood_processing,
    maple_tree_plant,
    maple_seeds,
    maple_wood,
    maple_wood_processing
})
