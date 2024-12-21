DECOCRAFT = require("config")

require("item-group")
require("craftables")

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "seeding" then
    require("plants")
end

if DECOCRAFT.CONFIG.SETTINGS["normal-trees-craft-type"] == "simple" then
    require("simple-trees")
end

require("technology")
