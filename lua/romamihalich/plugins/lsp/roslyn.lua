return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
        require("roslyn").setup()
        disable_lsp_for_git_directory("roslyn")
    end
}
