local utils = {}

utils.get_current_dir = function(path)
    return path:gsub('%.[^%.]+$', '')
end

return utils
