local base_trees = DECOCRAFT.CONFIG.BASE_TREES

local utils = require("utils")

for _, tree in pairs(base_trees) do
    utils.make_it_craftable(tree, "tree", DECOCRAFT.ITEM_GROUP, "craftable-simple-trees", "a[base-" .. tree .. "]")
end
