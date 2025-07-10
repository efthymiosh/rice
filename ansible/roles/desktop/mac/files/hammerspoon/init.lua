local hotkeys = require("paperwm_hotkeys")

PaperWM = hs.loadSpoon("PaperWM")
PaperWM.window_gap = 16
PaperWM.window_ratios = { 0.33, 0.5, 0.66 }
PaperWM:bindHotkeys(hotkeys)

WarpMouse = hs.loadSpoon("WarpMouse")
WarpMouse.margin = 2

PaperWM:start()
WarpMouse:start()

hs.hotkey.bind({"cmd"}, "return", function()
    hs.application.open("/opt/homebrew/bin/alacritty")
end)
