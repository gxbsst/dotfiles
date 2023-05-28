return {
  "goolord/alpha-nvim",
  config = function()
    local config = require("alpha.themes.startify").config
    require 'alpha'.setup(config)
  end,
}
