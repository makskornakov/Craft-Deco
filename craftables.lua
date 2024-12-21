local utils = require("utils")
local base_rocks = DECOCRAFT.CONFIG.BASE_ROCKS
local craftable_trees = DECOCRAFT.CONFIG.CRAFTABLE_TREES
local craftable_alive_trees = DECOCRAFT.CONFIG.CRAFTABLE_ALIVE_TREES
local craftable_corpses = DECOCRAFT.CONFIG.CRAFTABLE_CORPSE

-- add craftable rocks, ruins, etc.
for planet, rocks in pairs(base_rocks) do
    for _, name in pairs(rocks) do
        utils.make_it_craftable(name, "simple-entity", DECOCRAFT.ITEM_GROUP, "craftable-grass", "c[base-" .. name .. "]")
    end
end

-- add weird trees that are always craftable
for planet, trees in pairs(craftable_trees) do
    for _, name in pairs(trees) do
        utils.make_it_craftable(name, "tree", DECOCRAFT.ITEM_GROUP, "craftable-trees", "f[base-" .. name .. "]")
    end
end

-- add weird trees that are always craftable that are also alive to some point
for planet, trees in pairs(craftable_alive_trees) do
    for _, name in pairs(trees) do
        utils.make_it_craftable(name, "tree", DECOCRAFT.ITEM_GROUP, "craftable-alive-trees", "e[base-" .. name .. "]")
        if DECOCRAFT.CONFIG.ENABLED["realistic-alive-trees"] then
            data.raw["tree"][name].surface_conditions = {
                {
                    property = "pressure",
                    min = 500,
                    max = 2500
                }
            }
        end
    end
end

-- add craftable lightning attractor cuz its a special prototype
if mods['space-age'] then
    utils.make_it_craftable("fulgoran-ruin-attractor", "lightning-attractor", "Environment", "craftable-attractors",
        "d[base-fulgoran-ruin-attractor]")
end
