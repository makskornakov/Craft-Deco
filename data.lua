DECOCRAFT = require("config")

require("prototypes.item-group")
require("prototypes.craftables")

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "seeding" then
    require("prototypes.plants")
end

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then
    require("prototypes.simple-trees")
end

require("prototypes.technology")
