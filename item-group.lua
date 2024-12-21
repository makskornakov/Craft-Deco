local utils = require("utils")

-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "craftable-alive-trees",
--         group = "environment",
--         order = "a"
--     }
-- })
-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "craftable-trees",
--         group = "environment",
--         order = "b"
--     }
-- })
-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "craftable-grass",
--         group = "environment",
--         order = "c"
--     }
-- })
-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "craftable-attractors",
--         group = "environment",
--         order = "d"
--     }
-- })

utils.create_item_subgroup("craftable-alive-trees", "environment", "a")
utils.create_item_subgroup("craftable-trees", "environment", "b")
utils.create_item_subgroup("craftable-grass", "environment", "c")
utils.create_item_subgroup("craftable-attractors", "environment", "d")

if mods["alien-biomes"] then
    -- data:extend({
    --     {
    --         type = "item-subgroup",
    --         name = "craftable-alien-trees",
    --         group = "environment",
    --         order = "e"
    --     }
    -- })
    utils.create_item_subgroup("craftable-alien-biomes-rocks", "environment", "e")
end

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then
    -- data:extend({
    --     {
    --         type = "item-subgroup",
    --         name = "craftable-simple-trees",
    --         group = "environment",
    --         order = "a"
    --     }
    -- })
    utils.create_item_subgroup("craftable-simple-trees", "environment", "a")

    if mods["alien-biomes"] then
        -- data:extend({
        --     {
        --         type = "item-subgroup",
        --         name = "craftable-alien-trees",
        --         group = "environment",
        --         order = "b"
        --     }
        -- })
        utils.create_item_subgroup("craftable-alien-biomes-trees", "environment", "b")
    end
end

