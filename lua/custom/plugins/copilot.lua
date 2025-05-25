-- lua/plugins/copilot.lua

return {
  {
    'github/copilot.vim',
    -- Set to true or false to enable/disable the plugin by default
    enabled = true, -- Set to false if you want to manually enable it later or load conditionally
    -- How to lazy-load Copilot. Choose what suits you best:
    -- event = "VeryLazy", -- Loads after Neovim startup and other critical plugins
    -- event = 'VimEnter', -- Loads when you first enter insert mode in any buffer
    cmd = 'Copilot', -- Loads when you first run a :Copilot command
    -- cmd = { "Copilot", "CopilotPanel", "CopilotSuggestion" }, -- Load on any of these commands
    -- The 'opts' table is the recommended way to pass configuration to plugins
    -- that expose a Lua 'setup' function. lazy.nvim will automatically call
    -- require("copilot").setup(opts) for you.
    opts = {
      -- Suggestions configuration
      suggestion = {
        enabled = true, -- Enable suggestions
        auto_trigger = true, -- Automatically trigger suggestions
        debounce = 75, -- Debounce time in ms for auto_trigger
        -- Keymaps for suggestions. <Plug>(copilot_*) are the plugin's internal mappings
        keymap = {
          accept = '<C-l>', -- Accept the current suggestion (e.g., Ctrl+L)
          accept_word = false, -- Disable default mapping for accepting a word
          accept_line = false, -- Disable default mapping for accepting a line
          next = '<M-]>', -- Go to the next suggestion (e.g., Alt+])
          prev = '<M-[>', -- Go to the previous suggestion (e.g., Alt+[)
          dismiss = '<C-e>', -- Dismiss suggestions (e.g., Ctrl+E)
        },
      },
      -- Panel configuration (for multiple suggestions)
      panel = {
        enabled = true, -- Enable the Copilot panel
        auto_refresh = true, -- Automatically refresh panel when suggestions change
        -- keymap = {
        --   jump_prev = "[[",
        --   jump_next = "]]",
        --   accept = "<CR>",
        --   refresh = "gr",
        --   open = "<M-CR>" -- Example: Alt+Enter to open panel
        -- }
      },
      -- Filetype configurations
      -- By default, Copilot is enabled for most common filetypes.
      -- You can explicitly enable/disable for specific filetypes.
      filetypes = {
        yaml = true,
        markdown = true,
        terraform = true,
        -- To disable for all filetypes by default and enable only specific ones:
        -- ["*"] = false,
        lua = true,
        python = true,
        -- To disable for a specific filetype:
        -- help = false,
        -- gitcommit = false,
      },
      -- If you use a proxy
      -- proxy = "http://your_proxy_server:port",

      -- For advanced users: Override server options
      -- server_opts_override = {
      --   trace = "verbose", -- For debugging
      -- },
    },

    -- The 'config' function runs after the plugin is loaded.
    -- If you've used the 'opts' table, lazy.nvim often calls setup automatically.
    -- However, explicitly calling it here gives you more control and ensures it runs
    -- with the provided opts. The 'opts' from the plugin spec are passed as the
    -- second argument to this function.
    config = function(_, opts)
      require('custom.plugins.copilot').setup(opts)
      -- You can add additional setup here, like custom commands or keymaps
      -- that are not covered by the plugin's own 'opts'.

      -- Example: Disable the default <Tab> mapping if it conflicts with your completion setup
      -- vim.g.copilot_no_tab_map = true

      -- Example: A keymap to toggle Copilot suggestions globally
      -- vim.keymap.set("n", "<leader>ct", function()
      --   local copilot = require("copilot.suggestion")
      --   if copilot.is_enabled() then
      --     copilot.disable()
      --     vim.notify("Copilot suggestions disabled", vim.log.levels.INFO)
      --   else
      --     copilot.enable()
      --     vim.notify("Copilot suggestions enabled", vim.log.levels.INFO)
      --   end
      -- end, { desc = "Toggle Copilot Suggestions" })
    end,
  },
}
