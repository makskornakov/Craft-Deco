data:extend({
    {
        type = "bool-setting",
        name = "real-alive-trees",
        setting_type = "startup",
        default_value = true,
        order = "a-a"
    },
    {
        type = "string-setting",
        name = "normal-trees-craft-type",
        setting_type = "startup",
        -- default_value = "seeding",
        -- if space age is enabled, default to seeding if not default to crafting
        default_value = mods["space-age"] and "seeding" or "simple",
        allowed_values = {
            "off",
            "simple",
            -- "seeding"
            -- if space age is enabled, add seeding to allowed values
            mods["space-age"] and "seeding" or nil
        },
        order = "a-b"
    }

})
