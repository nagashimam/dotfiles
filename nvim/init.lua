UsingHomePC = os.getenv("HOME_PC")

require("plugin")
require("lisp")

require("other")
require("keymap")

require("ui")
if UsingHomePC then
  require("home_colorscheme")
else
  require("colorscheme")
end

require("lsp")
