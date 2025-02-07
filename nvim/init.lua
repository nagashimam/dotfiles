UsingHomePc = os.getenv("HOME_PC")
require("plugin")
require("lsp")
require("completion")
require("style")

if UsingHomePc then
  require("home_colorscheme")
else
  require("colorscheme")
end
