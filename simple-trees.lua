local base_trees = DECOCRAFT.CONFIG.BASE_TREES

-- import entity_ingredients from craftables.lua
local utils = require("utils")

for _, tree in pairs(base_trees) do
    utils.make_it_craftable(tree, "tree", DECOCRAFT.ITEM_GROUP, "craftable-simple-trees", "a[base-" .. tree .. "]")
    -- data:extend({
    --     {
    --         type = "item",
    --         name = "decocraft-base-" .. tree,
    --         icon = data.raw["tree"][tree].icon,
    --         icon_size = 64,
    --         icon_mipmaps = 4,
    --         subgroup = "craftable-simple-trees",
    --         order = "a[base-" .. tree .. "]",
    --         stack_size = 20,
    --         place_result = tree,
    --         localised_name = {
    --             "entity-name." .. tree:gsub("(%-%d+)", "", 1)
    --         }
    --     }
    -- })
    -- -- for _, tree in pairs(base_trees) do
    -- data:extend({
    --     {
    --         type = "recipe",
    --         name = "decocraft-base-" .. tree,
    --         energy_required = 2,
    --         -- enabled = false,
    --         enabled = true,
    --         category = "crafting",
    --         subgroup = "craftable-simple-trees",
    --         ingredients = utils.entity_ingredients(tree, "tree"),
    --         results = {
    --             {
    --                 type = "item",
    --                 name = "decocraft-base-" .. tree,
    --                 amount = 1
    --             }
    --         },
    --         localised_name = {
    --             "recipe-name." .. tree:gsub("(%-%d+)", "", 1)
    --         }
    --     }
    -- })
    -- -- end
end
