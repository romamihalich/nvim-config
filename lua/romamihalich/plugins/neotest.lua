return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",

        -- C# test support
        "nsidorenco/neotest-vstest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-vstest"),
            },
        })

        vim.keymap.set("n", "<leader>dt", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "Debug Test" })
    end,
}
