return {
    -- Install tree-sitter cli first https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install {
            "lua",
            "python",
            "bash",
            "markdown",
            "markdown_inline",
            "yaml",
            "groovy",
            "c",
            "cpp",
            "hcl",
            "terraform",
            "zsh",
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "lua",
                "python",
                "bash",
                "markdown",
                "yaml",
                "groovy",
                "c",
                "cpp",
                "hcl",
                "terraform",
                "zsh",
            },
            callback = function()
                vim.treesitter.start() -- highlighting
                -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- folds
                -- vim.wo.foldmethod = "expr"
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
            end,
        })
    end,
}
