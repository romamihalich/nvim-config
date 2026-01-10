return {
    -- "danymat/neogen",
    -- version = "*",

    -- using my fork with improvements for C#
    "romamihalich/neogen",
    -- local path to my fork for development
    -- dir = "/home/romamihalich/projects/neogen-cs-improvements/neogen",
    -- local path to main plugin for development
    -- dir = "/home/romamihalich/projects/repos__/neogen",

    opts = {
        languages = {
            cs = {
                template = {
                    annotation_convention = "xmldoc"
                }
            },
        }
    }
}
