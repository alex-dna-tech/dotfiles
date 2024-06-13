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

  attachments = {
    img_folder = "Files", -- This is the default
  },
})
