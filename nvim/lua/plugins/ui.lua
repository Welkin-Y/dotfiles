return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
      cmdline = {
        view = "cmdline",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
      ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            enabled = function()
              return vim.fn.executable("fortune") == 1 and vim.fn.executable("cowsay") == 1 and vim.o.columns > 122
            end,
            cmd = "fortune -s | cowsay",
            height = 10,
            width = 50,
            padding = 1,
            indent = 5,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
                and vim.o.columns > 122
                and vim.fn.executable("git") == 1
                and vim.fn.filereadable(vim.fn.expand("~/.gitconfig"))
            end,
            cmd = "git status --short --branch --renames",
            height = 4,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          {
            pane = 2,
            section = "terminal",
            enabled = function()
              return vim.fn.executable("fastfetch") == 1
                and vim.fn.filereadable(vim.fn.expand("~/.config/fastfetch/config.jsonc")) == 1
                and vim.o.columns > 122
            end,
            cmd = "fastfetch -c /home/$USER/.config/fastfetch/config.jsonc -l none --color cyan",
            height = 10,
            padding = 0,
            indent = 0,
          },
          { section = "startup", padding = 1 },
        },
      },
      notifier = {
        top_down = false,
        margin = { top = 1, right = 0, bottom = 0 },
      },
    },
  },
}
