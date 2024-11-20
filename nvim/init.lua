local UsingHomePC = os.getenv("HOME_PC")

require("plugin")
require("lsp")
require("linter")
require("style")

require("keymap")
require("other")

require("ui")
if UsingHomePC then
  require("home_colorscheme")
else
  require("colorscheme")
end

require("lsp")
