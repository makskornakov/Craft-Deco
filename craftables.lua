local function entity_ingredients(name, type)
    local entity = data.raw[type][name]
    local ingredients = {}
    if entity.minable then
        if entity.minable.results then
            for _, result in pairs(entity.minable.results) do
                if result.amount_max then
                    table.insert(ingredients, {
                        type = "item",
                        name = result.name,
                        amount = result.amount_max * 1.1
                    })
                elseif result.amount then
                    table.insert(ingredients, {
                        type = "item",
                        name = result.name,
                        amount = result.amount * 1.5
                    })
                end
            end
        elseif entity.minable.result then
            table.insert(ingredients, {
                type = "item",
                name = entity.minable.result,
                amount = entity.minable.count * 1.5
            })
        end
    end
    return ingredients
end

local function make_it_craftable(name, type, group, subgroup, order)
    data:extend({
        {
            type = "recipe",
            name = "decocraft-base-" .. name,
            energy_required = 2,
            -- enabled = false,
            enabled = true,
            category = "crafting",
            -- hidden_in_factoriopedia = true,
            -- factoriopedia_alternative = type .. "/" .. name,
            ingredients = entity_ingredients(name, type),
            results = {
                {
                    type = "item",
                    name = "decocraft-base-" .. name,
                    amount = 1
                }
            }
        }
    })

    data:extend({
        {
            type = "item",
            name = "decocraft-base-" .. name,
            icon = data.raw[type][name].icon,
            icon_size = 64,
            icon_mipmaps = 4,
            group = group,
            subgroup = subgroup,
            hidden_in_factoriopedia = true,
            -- factoriopedia_alternative = name,
            order = order,
            stack_size = 20,
            place_result = name,
            localised_name = {
                "entity-name." .. name
            }
        }
    })

    -- hide the original entity from factoriopedia
    -- data.raw[type][name].hidden_in_factoriopedia = true
end

local base_rocks = DECOCRAFT.CONFIG.BASE_ROCKS
local craftable_trees = DECOCRAFT.CONFIG.CRAFTABLE_TREES
local craftable_alive_trees = DECOCRAFT.CONFIG.CRAFTABLE_ALIVE_TREES

for _, name in pairs(base_rocks) do
    make_it_craftable(name, "simple-entity", DECOCRAFT.ITEM_GROUP, "grass", "c[base-" .. name .. "]")
end

for _, name in pairs(craftable_trees) do
    make_it_craftable(name, "tree", DECOCRAFT.ITEM_GROUP, "craftable-trees", "b[base-" .. name .. "]")
end

for _, name in pairs(craftable_alive_trees) do
    make_it_craftable(name, "tree", DECOCRAFT.ITEM_GROUP, "craftable-alive-trees", "a[base-" .. name .. "]")
    if DECOCRAFT.CONFIG.ENABLED["realistic-alive-trees"] then
        data.raw.tree[name].surface_conditions = {
            {
                property = "pressure",
                min = 500,
                max = 2500
            }
        }
    end
end

-- add craftable lightning attractor cuz its a special prototype
make_it_craftable("fulgoran-ruin-attractor", "lightning-attractor", "Environment", "craftable-attractors",
    "d[base-fulgoran-ruin-attractor]")

