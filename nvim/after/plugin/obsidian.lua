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

  disable_frontmatter = true,

  attachments = {
    img_folder = "Files", -- This is the default
  },
})
