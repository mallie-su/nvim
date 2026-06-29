return {
    {
    	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
	        'nvim-lua/plenary.nvim',
	        -- optional but recommended
        	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    	},
	opts = {
      	  extensions = {
        	    fzf = {},
        	},
    	},
	config = function()
        	require("telescope").load_extension "fzf"
	end,
	cmd = "Telescope",
	keys = {
        	{ "<Leader>b", ":Telescope buffers<CR>", desc = "[S]earch [B]uffers", silent = true },
	        { "<Leader>ss", ":Telescope builtin<CR>", desc = "[S]earch builtin", silent = true },
	        { "<Leader>sh", ":Telescope help_tags<CR>", desc = "[S]earch [H]elp", silent = true },
	        { 
			"<leader>sf",
			":Telescope find_files<CR>",
			desc = "[S]earch [F]iles", 
			silent = true 
		},
	        { "<leader>sb", ":Telescope git_branches<CR>", desc = "[S]earch git [B]ranches", silent = true },
	        { "<leader>sr", ":Telescope lsp_references<CR>", desc = "[S]earch LSP [R]eferences", silent = true },
	        { "<leader>sl", ":Telescope live_grep<CR>", desc = "[S]earch [L]ive_grep", silent = true },
        	{
	            "<leader>sc",
	            function()
	                require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
	            end,
	            desc = "[S]earch neovim [C]onfig",
	            silent = true,
        	},
	},
    }
}
