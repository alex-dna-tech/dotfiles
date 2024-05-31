require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Trans",
    },
    {
      name = "work",
      path = "~/Nextcloud/Documents/Notes",
    },
  },
  daily_notes = {
    folder = "Calendar/Daily",
  },
  mappings = {
    ["fo"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
})
