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
