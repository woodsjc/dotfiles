local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "elixir",
        "go",
        "heex",
        "html",
        "javascript",
        "json",
        "julia",
        "lua",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
