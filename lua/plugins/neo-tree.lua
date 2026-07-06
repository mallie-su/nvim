return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    keys = {
        { "<Leader>t", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true }
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
    	close_if_last_window = true,
    }
  }
}
