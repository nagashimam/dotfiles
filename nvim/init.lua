UsingHomePc = os.getenv("HOME_PC")
require("plugin")
require("lsp")
require("completion")
require("keymap")
require("style")
require("linter")
require("other")

if UsingHomePc then
  require("home_colorscheme")
else
  require("colorscheme")
end
