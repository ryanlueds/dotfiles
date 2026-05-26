local M = {}

local build_commands = {}

-- Register the PackChanged autocmd once.
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(args)
        local plugin_name = args.data.spec.name
        local cmd = build_commands[plugin_name]
        if cmd and (args.data.kind == 'install' or args.data.kind == 'update') then
            if type(cmd) == 'string' then
                vim.system({ cmd }, { cwd = args.data.path })
            else
                -- Run in a protected call to avoid crashing the UI.
                pcall(cmd)
            end
        end
    end,
})

---@class PluginSpec
---@field src string The GitHub repository of the plugin
---@field module_name? string Optional module name for configuration (defaults to the repo name)
---@field opts? table|fun():table Optional configuration options for the plugin
---@field on_setup? fun():nil Optional function to run after the plugin is loaded and configured
---@field setup? false Set to false to skip require/setup entirely (for vimscript-only or data-only plugins)

---@param plugins PluginSpec[]
local function configure(plugins)
    local specs = {}
    for _, plugin in ipairs(plugins) do
        local name = plugin.src:match '.+/(.+)'
        table.insert(specs, {
            src = 'https://github.com/' .. plugin.src,
            name = name,
        })
    end

    -- Add plugins using the native vim.pack API.
    -- This handles installation and adds them to the runtimepath.
    vim.pack.add(specs)

    -- Configure each plugin after loading.
    for _, plugin in ipairs(plugins) do
        local name = plugin.src:match '.+/(.+)'
        local module_name = plugin.module_name or name:gsub('%.nvim$', '')

        if plugin.setup ~= false then
            local ok, mod = pcall(require, module_name)
            if ok and type(mod.setup) == 'function' then
                local opts = type(plugin.opts) == 'function' and plugin.opts() or plugin.opts
                mod.setup(opts or {})
            end
        end

        if plugin.on_setup then
            pcall(plugin.on_setup)
        end
    end
end

--- Helper function for adding and configuring plugins eagerly, with no lazy-loading.
---
---@param plugins PluginSpec[]
function M.add(plugins)
    configure(plugins)
end

---@param event vim.api.keyset.events|vim.api.keyset.events[]
---@param pattern? string|string[]
---@param plugins PluginSpec[]
local add_on_event = function(event, pattern, plugins)
    vim.api.nvim_create_autocmd(event, {
        pattern = pattern,
        once = true,
        callback = function()
            configure(plugins)
        end,
    })
end

--- Helper function for adding and configuring plugins to the current session on a specific event.
---
---@param event vim.api.keyset.events|vim.api.keyset.events[]
---@param plugins PluginSpec[]
function M.add_on_event(event, plugins)
    add_on_event(event, nil, plugins)
end

--- Helper function for adding and configuring plugins to the current session when a file of a specific type is first opened.
---
---@param patterns string|string[]
---@param plugins PluginSpec[]
function M.add_on_file_type(patterns, plugins)
    add_on_event('FileType', patterns, plugins)
end

--- Runs the given command inside the plugin's directory when the plugin is updated.
---
---@param plugin_name string Plugin name
---@param cmd string|fun():nil Command to run
function M.on_plugin_update(plugin_name, cmd)
    build_commands[plugin_name] = cmd
end

return M
