local installed, autotag = pcall(require, 'nvim-ts-autotag')
if not installed then return end

autotag.setup()
