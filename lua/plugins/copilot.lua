return {
    "github/copilot.vim",
    dependencies = {},
    event = 'InsertEnter',
    lazy = true,
    keys = { "<leader>ce" },
    config = function()
        vim.keymap.set("n", "<leader>cd", ":Copilot disable <CR>", {})
        vim.keymap.set("n", "<leader>ce", ":Copilot enable <CR>", {})
    end,
}
