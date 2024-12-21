local DECOCRAFT = {}

local utils = require("utils")

DECOCRAFT.CONFIG = {}

DECOCRAFT.ITEM_GROUP = "Environment"

DECOCRAFT.CONFIG.ENABLED = {
    ["realistic-alive-trees"] = settings.startup["real-alive-trees"].value
}

DECOCRAFT.CONFIG.SETTINGS = {
    ["normal-trees-craft-type"] = settings.startup["normal-trees-craft-type"].value
}

-- DECOCRAFT.CONFIG.REALISTIC_ALIVE_TREES = true

DECOCRAFT.CONFIG.BASE_TREES = {
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

DECOCRAFT.CONFIG.CRAFTABLE_TREES = {
    "dead-dry-hairy-tree",
    "dead-grey-trunk",
    "dead-tree-desert",
    "dry-hairy-tree",
    "dry-tree"
}

if mods['space-age'] then
    utils.array_concat(DECOCRAFT.CONFIG.CRAFTABLE_TREES, {
        "ashland-lichen-tree",
        "ashland-lichen-tree-flaming"
    })
end

DECOCRAFT.CONFIG.CRAFTABLE_ALIVE_TREES = {
    "tree-06",
    "tree-06-brown"
}

if mods['space-age'] then
    utils.array_concat(DECOCRAFT.CONFIG.CRAFTABLE_ALIVE_TREES, {
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
    })

end

DECOCRAFT.CONFIG.BASE_ROCKS = {
    "big-rock",
    "big-sand-rock",
    "huge-rock"
}

if mods['space-age'] then
    utils.array_concat(DECOCRAFT.CONFIG.BASE_ROCKS, {
        "big-volcanic-rock",
        "big-fulgora-rock",
        "copper-stromatolite",
        "fulgoran-ruin-big",
        "fulgoran-ruin-colossal",
        "fulgoran-ruin-huge",
        "fulgoran-ruin-medium",
        "fulgoran-ruin-small",
        "fulgoran-ruin-stonehenge",
        "fulgoran-ruin-vault",
        "fulgurite",
        "fulgurite-small",
        "huge-volcanic-rock",
        "iron-stromatolite",
        "lithium-iceberg-big",
        "lithium-iceberg-huge",
        "vulcanus-chimney",
        "vulcanus-chimney-cold",
        "vulcanus-chimney-faded",
        "vulcanus-chimney-short",
        "vulcanus-chimney-truncated"
    })

end

return DECOCRAFT
