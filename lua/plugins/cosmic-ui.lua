local cosmic_ui_installed, cosmic_ui = pcall(require, "cosmic-ui")
if not cosmic_ui_installed then return end

cosmic_ui.setup()
