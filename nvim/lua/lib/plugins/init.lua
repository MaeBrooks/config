require "lib/plugins/setup"
local fold = require "lib.tools.fold"
local configure = require("lazy").setup

local configs = fold(function(configs, path)
  for _, config in ipairs(require(path)) do
    configs[#configs + 1] = config
  end

  return configs
end, {
  "lib.plugins.configs.color",
  "lib.plugins.configs.project_rooter",
  "lib.plugins.configs.highlight",
  "lib.plugins.configs.mini",
  "lib.plugins.configs.git",
  "lib.plugins.configs.search",
  "lib.plugins.configs.lsp",
}, {})

configure(configs)
