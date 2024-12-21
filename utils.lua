local utils = {}

-- Helper function to concatenate arrays
function utils.array_concat(t1, t2)
    for _, v in ipairs(t2) do
        t1[#t1 + 1] = v
    end
end

function utils.create_item_subgroup(name, group, order)
    data:extend({
        {
            type = "item-subgroup",
            name = name,
            group = group,
            order = order
        }
    })
end

-- entity_ingredients
function utils.entity_ingredients(name, type)
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

-- make_it_craftable
function utils.make_it_craftable(name, type, group, subgroup, order)
    data:extend({
        {
            type = "item",
            name = "decocraft-base-" .. name,
            -- icons = data.raw[type][name].icons,
            -- icon or icons depending on what is present in the entity
            icon = data.raw[type][name].icon,
            icons = data.raw[type][name].icons,

            icon_size = 64,
            icon_mipmaps = 4,
            group = group,
            subgroup = subgroup,
            -- hidden_in_factoriopedia = true,
            -- factoriopedia_alternative = name,
            order = order,
            stack_size = 20,
            place_result = name,
            -- remove "-02" kind of suffixes from the name to get the correct localised name
            -- localised_name = {
            --     "entity-name." .. name:gsub("(%-%d+)", "", 1)
            -- }
            localised_name = data.raw[type][name].localised_name

        },
        {
            type = "recipe",
            name = "decocraft-base-" .. name,
            energy_required = 2,
            -- enabled = false,
            enabled = true,
            category = "crafting",
            -- hidden_in_factoriopedia = true,
            -- factoriopedia_alternative = type .. "/" .. name,
            ingredients = utils.entity_ingredients(name, type),
            results = {
                {
                    type = "item",
                    name = "decocraft-base-" .. name,
                    amount = 1
                }
            }
        }
    })

    -- data.raw[type][name].can_be_part_of_blueprint = true
    -- make it blueprintable

    -- hide the original entity from factoriopedia
    -- data.raw[type][name].hidden_in_factoriopedia = true
end

return utils

