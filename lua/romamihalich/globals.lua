-- signs used to display
Signs = {
    error = "",
    warn = "",
    hint = "",
    info = "",
}

function IsWindows()
    return vim.uv.os_uname().sysname ~= "Linux"
end

local patched_servers = {}

function disable_lsp_for_git_directory(server_name)
    if vim.tbl_contains(patched_servers, server_name) then
        return
    end
    local server_config = vim.lsp.config[server_name]
    local core_root_dir = server_config.root_dir
    -- assert(core_root_dir ~= nil)
    table.insert(patched_servers, server_name)
    vim.lsp.config(server_config.name, {
        root_dir = function(bufnr, on_dir)
            local bufname = vim.fn.bufname(bufnr)
            if bufname:find(".git/") then
                return
            end

            if core_root_dir ~= nil then
                if type(core_root_dir) == "string" then
                    on_dir(core_root_dir)
                else
                    core_root_dir(bufnr, on_dir)
                end
            else
                on_dir(vim.fn.getcwd())
            end
        end
    })
end
