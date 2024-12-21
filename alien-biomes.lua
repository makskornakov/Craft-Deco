if mods["alien-biomes"] then

    local utils = require("utils")
    -- Trees
    local trees = {
        "tree-wetland-a",
        "tree-wetland-b",
        "tree-wetland-c",
        "tree-wetland-d",
        "tree-wetland-e",
        "tree-wetland-f",
        "tree-wetland-g",
        "tree-wetland-h",
        "tree-wetland-i",
        "tree-wetland-j",
        "tree-wetland-k",
        "tree-wetland-l",
        "tree-wetland-m",
        "tree-wetland-n",
        "tree-wetland-o",
        "tree-grassland-a",
        "tree-grassland-b",
        "tree-grassland-c",
        "tree-grassland-d",
        "tree-grassland-e",
        "tree-grassland-f",
        "tree-grassland-g",
        "tree-grassland-h",
        "tree-grassland-i",
        "tree-grassland-j",
        "tree-grassland-k",
        "tree-grassland-l",
        "tree-grassland-m",
        "tree-grassland-n",
        "tree-grassland-o",
        "tree-grassland-p",
        "tree-grassland-q",
        "tree-dryland-a",
        "tree-dryland-b",
        "tree-dryland-c",
        "tree-dryland-d",
        "tree-dryland-e",
        "tree-dryland-f",
        "tree-dryland-g",
        "tree-dryland-h",
        "tree-dryland-i",
        "tree-dryland-j",
        "tree-dryland-k",
        "tree-dryland-l",
        "tree-dryland-m",
        "tree-dryland-n",
        "tree-dryland-o",
        "tree-desert-a",
        "tree-desert-b",
        "tree-desert-c",
        "tree-desert-d",
        "tree-desert-e",
        "tree-desert-f",
        "tree-desert-g",
        "tree-desert-h",
        "tree-desert-i",
        "tree-desert-j",
        "tree-desert-k",
        "tree-desert-l",
        "tree-desert-m",
        "tree-desert-n",
        "tree-snow-a",
        "tree-volcanic-a",
        "tree-palm-a",
        "tree-palm-b"
    }

    -- Don't allow tree crafting when Arborium or Arborium Renewed is installed (as they handle tree crafting)
    if mods["Arborium"] or mods["Arborium_Renewed"] then
        trees = {}
    end

    -- Rocks
    local rocks = {}
    local rock_prototypes = {
        "rock-huge",
        "rock-big"
    }
    local tints = {
        tan = {
            193,
            162,
            127
        },
        white = {
            255,
            255,
            255
        },
        grey = {
            177,
            183,
            187
        },
        black = {
            135,
            135,
            135
        },
        purple = {
            169,
            177,
            239
        },
        red = {
            185,
            107,
            105
        },
        violet = {
            165,
            107,
            161
        },
        dustyrose = {
            180,
            148,
            137
        },
        cream = {
            234,
            216,
            179
        },
        brown = {
            162,
            117,
            88
        },
        beige = {
            178,
            164,
            138
        },
        aubergine = {
            126,
            115,
            156
        }
    }
    for _, rock in pairs(rock_prototypes) do
        for tint, color in pairs(tints) do
            table.insert(rocks, {
                name = rock .. "-" .. tint,
                tint = tint,
                color = color,
                prototype = rock
            })
        end
    end

    -- add trees if tree crafting is in simple mode
    if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then

        for _, tree in pairs(trees) do
            if data.raw["tree"][tree] then
                utils.make_it_craftable(tree, "tree", DECOCRAFT.ITEM_GROUP, "craftable-alien-biomes-trees",
                    "a[alien-biomes-" .. tree .. "]")
            end
        end

    end

    -- add rocks
    for _, rock in pairs(rocks) do
        if data.raw["simple-entity"][rock.name] then
            utils.make_it_craftable(rock.name, "simple-entity", DECOCRAFT.ITEM_GROUP, "craftable-alien-biomes-rocks",
                "a[alien-biomes-" .. rock.name .. "]")
        end
    end

end

