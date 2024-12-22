local utils = {}

function utils.array_concat(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if not t1[k] then
                t1[k] = {}
            end
            utils.array_concat(t1[k], v)
        else
            table.insert(t1, v)
        end
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
            name = "craftdeco-base-" .. name,
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
            localised_name = data.raw[type][name].localised_name

        },
        {
            type = "recipe",
            name = "craftdeco-base-" .. name,
            energy_required = 2,
            enabled = false,
            category = "crafting",
            -- hidden_in_factoriopedia = true,
            -- factoriopedia_alternative = type .. "/" .. name,
            ingredients = utils.entity_ingredients(name, type),
            results = {
                {
                    type = "item",
                    name = "craftdeco-base-" .. name,
                    amount = 1
                }
            }
        }
    })

end

return utils

