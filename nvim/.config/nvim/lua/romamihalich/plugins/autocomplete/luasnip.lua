return {
    'L3MON4D3/LuaSnip',
    config = function()
        local ls = require'luasnip'

        ls.config.set_config({
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = false,
        })

        local s, i, t, c, f = ls.s, ls.insert_node, ls.text_node, ls.choice_node, ls.function_node
        local fmt = require'luasnip.extras.fmt'.fmt

        ls.add_snippets("all", {
            ls.parser.parse_snippet("lorem", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus non interdum nunc. Fusce id velit leo. Nulla commodo mauris vel semper scelerisque. Phasellus nec viverra nunc. Nunc dictum mi vitae velit feugiat, at luctus nibh pulvinar. Nullam a eros ex. Nam eu dapibus justo, et tincidunt lacus. Quisque non porta enim. Integer eget mauris fringilla, tincidunt enim in, finibus nibh. Nunc dictum diam tellus, sit amet congue mi pellentesque nec. Aliquam faucibus dictum libero, ut pulvinar erat malesuada at. Pellentesque dignissim vehicula metus. Ut fermentum turpis nunc."),
            s("test", fmt(
                "test {} <--- {}",
                { i(1, "default"), i(0) })
            ),
            s("today", fmt(
                "today {} -- {}",
                {
                    i(1),
                    f(function(arg)
                        -- print(vim.inspect(arg))
                        local inp = arg[1][1]
                        if inp == "date" then
                            return os.date()
                        end
                        return ""
                    end, { 1 })
                })
            )
        })
    end
}
