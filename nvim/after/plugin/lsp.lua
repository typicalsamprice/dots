local ko = { silent = false, noremap = true }
local rayx = require("lsp_signature")
local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
 
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
 
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
  sources = cmp.config.sources({{ name = "nvim_lsp" }},
      {{ name = "path" }}),
  experimental = { ghost_text = true }
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({{ name = "path" }})
})

local on_attach = function(client, bufn)
    local function buf_map(...) vim.api.nvim_buf_set_keymap(bufn, ...) end
    local function buf_opt(...) vim.api.nvim_buf_set_option(bufn, ...) end

    buf_opt("omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", ko)
    buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", ko)
    buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", ko)
    buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", ko)
    buf_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", ko)
    buf_map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", ko)
    buf_map("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", ko)

    buf_map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", ko)
    buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", ko)
    buf_map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", ko)
    buf_map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", ko)
    buf_map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", ko)
    buf_map("n", "<space>lq", "<cmd>lua vim.diagnostic.set_loclist()<CR>", ko)
    buf_map("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", ko)

    rayx.on_attach({
        doc_lines = 0,
        handler_opts = {
            border = "none"
        }
    })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            completion = { postfix = { enable = false } }
        }
    }
} 

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true
    }
)
