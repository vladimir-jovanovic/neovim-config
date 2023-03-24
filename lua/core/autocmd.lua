vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert" })
vim.api.nvim_create_autocmd("TermClose", { command = "bd" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set("n", "<F5>", ":w<CR>:term python3 -i %<CR>")
        vim.keymap.set("i", "<F5>", ":w<CR>:term python3 -i %<CR>")
    end
})
