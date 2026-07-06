local ensure_installed = {
    "ansible-language-server",
    "bash-language-server",
    "dockerfile-language-server",
    "hadolint",
    "helm-ls",
    "json-lsp",
    "jsonnet-language-server",
    "lua-language-server",
    "prettier",
    "prettierd",
    "pyright",
    "ruff",
    "shellcheck",
    "shfmt",
    "stylua",
    "terraform-ls",
    "tflint",
    "yaml-language-server",
}

return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
        priority = 30,
        config = function()
            require("mason").setup({})

            local mr = require("mason-registry")
            mr.refresh(function()
                for _, tool in ipairs(ensure_installed) do
                    local ok, p = pcall(mr.get_package, tool)
                    if ok and not p:is_installed() then
                        p:install()
                    end
                end
            end)

            -- The Mason UI still exists in this setup; keep LazyVim's keymap.
            vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })
        end,
    }
}
