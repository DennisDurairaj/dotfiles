return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
      config = function()
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")
        telescope.setup({
          extensions = {
            live_grep_args = {
              auto_quoting = true,
              mappings = {
                i = {
                  ["<C-k>"] = lga_actions.quote_prompt(),
                  ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
              },
            },
          },
        })
        require("telescope").load_extension("live_grep_args")
      end,
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Live Grep Files",
    },
    {
      "<leader>gw",
      function()
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
        live_grep_args_shortcuts.grep_word_under_cursor({ postfix = " -g *" })
      end,
      desc = "Live Grep Current Word",
    },
  },
}
