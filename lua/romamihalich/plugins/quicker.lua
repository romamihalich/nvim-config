return {
    'stevearc/quicker.nvim',
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {
        edit = {
            -- Editing the quickfix like a normal buffer
            enabled = false,
        },
        type_icons = {
            E = Signs.error,
            W = Signs.warn,
            I = Signs.info,
            N = Signs.hint,
            H = Signs.hint,
        },
    },
}
