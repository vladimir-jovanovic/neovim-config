local status, _ = pcall(vim.cmd, 'colorscheme vscode')
if not status then
    print('Colorscheme vscode not found.')
    return
end
