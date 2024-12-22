local CRAFTDECO = {}

local utils = require("utils")

CRAFTDECO.CONFIG = {}

CRAFTDECO.ITEM_GROUP = "Environment"

CRAFTDECO.CONFIG.ENABLED = {
    ["realistic-alive-trees"] = settings.startup["real-alive-trees"].value
}

CRAFTDECO.CONFIG.SETTINGS = {
    ["normal-trees-craft-type"] = settings.startup["normal-trees-craft-type"].value
}

CRAFTDECO.CONFIG.BASE_TREES = {
    "tree-01",
    "tree-02",
    "tree-02-red",
    "tree-03",
    "tree-04",
    "tree-05",
    "tree-07",
    "tree-08",
    "tree-08-brown",
    "tree-08-red",
    "tree-09",
    "tree-09-brown",
    "tree-09-red"
}

CRAFTDECO.CONFIG.CRAFTABLE_TREES = {
    ["nauvis"] = {
        "dead-dry-hairy-tree",
        "dead-grey-trunk",
        "dead-tree-desert",
        "dry-hairy-tree",
        "dry-tree"
    }
}

if mods['space-age'] then
    utils.array_concat(CRAFTDECO.CONFIG.CRAFTABLE_TREES, {
        ["vulcanus"] = {
            "ashland-lichen-tree",
            "ashland-lichen-tree-flaming"
        }
    })
end

CRAFTDECO.CONFIG.CRAFTABLE_ALIVE_TREES = {
    ["nauvis"] = {
        "tree-06",
        "tree-06-brown"
    }
}

if mods['space-age'] then
    utils.array_concat(CRAFTDECO.CONFIG.CRAFTABLE_ALIVE_TREES, {
        ["gleba"] = {
            "sunnycomb",
            "slipstack",
            "cuttlepop",
            "boompuff",
            "stingfrond",
            "funneltrunk",
            "teflilly",
            "hairyclubnub",
            "lickmaw",
            "water-cane"
        }
    })

end

CRAFTDECO.CONFIG.BASE_ROCKS = {
    ["nauvis"] = {
        "big-rock",
        "big-sand-rock",
        "huge-rock"
    }
}

if mods['space-age'] then
    utils.array_concat(CRAFTDECO.CONFIG.BASE_ROCKS, {
        ["vulcanus"] = {
            "big-volcanic-rock",
            "vulcanus-chimney",
            "vulcanus-chimney-cold",
            "vulcanus-chimney-faded",
            "vulcanus-chimney-short",
            "vulcanus-chimney-truncated",
            "huge-volcanic-rock"
        },
        ["fulgora"] = {
            "big-fulgora-rock",
            "fulgoran-ruin-big",
            "fulgoran-ruin-colossal",
            "fulgoran-ruin-huge",
            "fulgoran-ruin-medium",
            "fulgoran-ruin-small",
            "fulgoran-ruin-stonehenge",
            "fulgoran-ruin-vault",
            "fulgurite",
            "fulgurite-small"
        },
        ["gleba"] = {
            "copper-stromatolite",
            "iron-stromatolite"
        },
        ["aquilo"] = {
            "lithium-iceberg-big",
            "lithium-iceberg-huge"
        }
    })

end

return CRAFTDECO
