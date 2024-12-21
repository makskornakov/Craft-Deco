local utils = require("utils")

utils.create_item_subgroup("craftable-alive-trees", "environment", "a")
utils.create_item_subgroup("craftable-trees", "environment", "b")
utils.create_item_subgroup("craftable-grass", "environment", "c")
utils.create_item_subgroup("craftable-attractors", "environment", "d")

if mods["alien-biomes"] then
    utils.create_item_subgroup("craftable-alien-biomes-rocks", "environment", "e")
end

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then
    utils.create_item_subgroup("craftable-simple-trees", "environment", "a")

    if mods["alien-biomes"] then
        utils.create_item_subgroup("craftable-alien-biomes-trees", "environment", "b")
    end
end

