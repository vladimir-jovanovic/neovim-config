local installed, nvim_ts_autotag = pcall(require, 'nvim-ts-autotag')
if not installed then return end

nvim_ts_autotag.setup({
  filetypes = { "html" , "xml" },
})

