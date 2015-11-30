--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "/", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

    if f == max then
        -- kind of "centering"
        local offset = 0.1
        f.x = max.w * offset
    	f.y = max.h * offset
    	f.w = max.w * (1 - offset * 2)
    	f.h = max.h * (1 - offset * 2)
    else
        -- maximize (not a fullscreen mode this)
    	f.x = max.x
    	f.y = max.y
    	f.w = max.w
    	f.h = max.h
    end
	win:setFrame(f, 0)
end)

--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f, 0)
end)

--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f, 0)
end)

--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f, 0)
end)

--
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x
	f.y = max.y + (max.h / 2)
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f, 0)
end)
