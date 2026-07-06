vim.g.have_nerd_font = false
vim.o.number = true
vim.opt.clipboard = "unnamedplus"

do
	vim.api.nvim_create_autocmd('TextYankPost', {
    		desc = 'Highlight when yanking (copying) text',
		group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
		callback = function() vim.hl.on_yank() end,
	})
end

-- number of columns occupied by a tab character
vim.opt.tabstop = 4

-- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.softtabstop = 4

-- width for autoindents
vim.opt.shiftwidth = 4

-- converts tabs to white space
vim.opt.expandtab = true

-- indent a new line the same amount as the line just typed
vim.opt.autoindent = true

