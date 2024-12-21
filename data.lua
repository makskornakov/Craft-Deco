DECOCRAFT = require("config")

-- local seconds = 60
-- local minutes = 60 * seconds

-- local fireArmor = table.deepcopy(data.raw["armor"]["heavy-armor"]) -- copy the table that defines the heavy armor item into the fireArmor variable

-- calculate the cost of the entity based upon what it gives when mined
-- original taken from Dectorio mod

require("item-group")
require("craftables")
require("plants")

-- local base_rocks = DECT.CONFIG.BASE_ROCKS
-- local base_trees = DECT.CONFIG.BASE_TREES
-- local craftable_trees = DECT.CONFIG.CRAFTABLE_TREES

-- for _, rock in pairs(base_rocks) do
--     data:extend({
--         {
--             type = "recipe",
--             name = "decocraft-base-" .. rock,
--             energy_required = 2,
--             -- enabled = false,
--             enabled = true,
--             category = "crafting",
--             ingredients = entity_ingredients(rock, "simple-entity"),
--             results = {
--                 {
--                     type = "item",
--                     name = "decocraft-base-" .. rock,
--                     amount = 1
--                 }
--             }
--         }
--     })
-- end

-- for _, rock in pairs(base_rocks) do
--     data:extend({
--         {
--             type = "item",
--             name = "decocraft-base-" .. rock,
--             icon = data.raw["simple-entity"][rock].icon,
--             icon_size = 64,
--             icon_mipmaps = 4,
--             group = "Environment",
--             subgroup = "grass",
--             order = "d[base-" .. rock .. "]",
--             stack_size = 10,
--             place_result = rock,
--             localised_name = {
--                 "entity-name." .. rock
--             }
--         }
--     })
-- end

-- add craftable ligthning attractor from data['lightning-attractor']'fulgoran-ruin-attractor'

-- test item for placing Decorations

-- for each rock edit the simple-entity prototype of the rock to include stateless_visualisation

-- example 
-- stateless_visualisation = {
-- animation = {
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-1",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-2",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-3",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-4",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-5",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-6",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),
-- util.sprite_load("__space-age__/graphics/decorative/aquilo-iceberg/floating-iceberg-7",
-- { scale = 0.5, frame_count = 31, animation_speed = 0.1, multiply_shift = 0.5, shift = {0, 0}}),

-- }
-- }
-- for _, rock in pairs(base_rocks) do
-- we dont know how many pictures there are, so we need to take all with name of the rock and like 01, 02, 03, etc
-- local animations = {}
-- for i = 1, 100 do
--     local picture = data.raw["simple-entity"][rock].pictures[i]
--     if picture then
--         table.insert(animations, {
--             {
--                 filename = picture.filename,
--                 draw_as_glow = true,
--                 priority = "extra-high",
--                 width = 34,
--                 height = 38,
--                 frame_count = 2,
--                 animation_speed = 1.5,
--                 shift = {
--                     0,
--                     0
--                 }
--             }
--         })
--     else
--         break
--     end
-- end
-- rock.stateless_visualisation = {
--     animation = animation
-- }
-- sheet = util.sprite_load("__space-age__/graphics/decorative/fulgoran-ruin/fulgoran-ruin-big", {

-- local spriteSheetPath = data.raw["simple-entity"][rock].pictures[1].filename 
-- withour the extension
-- local spriteSheetPath = string.gsub(data.raw["simple-entity"][rock].pictures[1].filename, ".png", "")
-- local shift = util.by_pixel(44.5 / 2, -7.5 / 2)
-- local stateless_visualisation = {
--     period = 0,
--     animation = {
--         sheet = util.sprite_load(spriteSheetPath, {
--             -- width = 448,
--             -- height = 320,
--             shift = shift,
--             line_length = 4
--             -- priority = "extra-high",
--             -- width = 448,
--             -- height = 320,
--             -- shift = shift,
--             -- line_length = 4,
--             -- variation_count = 8
--         })
--     }
-- }

-- data.raw["simple-entity"][rock].stateless_visualisation = {
--     animation = stateless_visualisation
-- }
-- data.raw["simple-entity"][rock].pictures = nil

-- end

-- data:extend({
--     {
--         type = "item-group",
--         name = "craft-decorations",
--         order = "d-a",
--         icon = "__DecoCraft__/graphics/item-group/craft-decorations.png",
--         icon_size = 128
--     }
-- })

-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "trees",
--         group = "Environment",
--         order = "i-c"
--     }
-- })

-- data:extend({
--     {
--         type = "item-subgroup",
--         name = "landscaping-trees",
--         group = "craft-decorations",
--         order = "i-d"
--     }
-- })

-- fireArmor.name = "fire-armor"
-- fireArmor.subgroup = "test-section"
-- fireArmor.icons = {
--   {
--     icon = fireArmor.icon,
--     icon_size = fireArmor.icon_size,
--     tint = {r=1,g=0,b=0,a=0.3}
--   },
-- }

-- fireArmor.resistances = {
--   {
--     type = "physical",
--     decrease = 6,
--     percent = 10
--   },
--   {
--     type = "explosion",
--     decrease = 10,
--     percent = 30
--   },
--   {
--     type = "acid",
--     decrease = 5,
--     percent = 30
--   },
--   {
--     type = "fire",
--     decrease = 0,
--     percent = 100
--   }
-- }

-- create the recipe prototype from scratch
-- local recipe = {
--   type = "recipe",
--   name = "fire-armor",
--   enabled = true,
--   energy_required = 8, -- time to craft in seconds (at crafting speed 1)
--   ingredients = {
--     {type = "item", name = "copper-plate", amount = 200},
--     {type = "item", name = "steel-plate", amount = 50}
--   },
--   results = {{type = "item", name = "fire-armor", amount = 1}}
-- }

-- data:extend{fireArmor, recipe}
