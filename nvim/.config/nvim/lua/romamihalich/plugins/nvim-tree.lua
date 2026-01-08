return {
    'kyazdani42/nvim-tree.lua',
    config = function()
        require'nvim-tree'.setup {
            disable_netrw       = true,
            hijack_netrw        = true,
            open_on_tab         = false,
            hijack_cursor       = true,
            update_cwd          = true,
            hijack_directories  = {
                enable = true,
                auto_open = true,
            },
            diagnostics = {
                enable = false,
                icons = {
                    error = Signs.error,
                    warning = Signs.warn,
                    hint = Signs.hint,
                    info = Signs.info,
                }
            },
            update_focused_file = {
                enable      = true,
                update_cwd  = false,
                ignore_list = {}
            },
            system_open = {
                cmd  = nil,
                args = {}
            },
            filters = {
                dotfiles = false,
                custom = {}
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            view = {
                width = 30,
                -- height = 30,
                side = 'left',
                number = false,
                relativenumber = false
            },
            trash = {
                cmd = "trash",
                require_confirm = true
            },
            actions = {
                open_file = {
                    resize_window = false,
                    quit_on_open = false,
                }
            },
        }

        Keymap("n", "<leader>E", vim.cmd.NvimTreeToggle, "Explorer toggle")
    end
}
