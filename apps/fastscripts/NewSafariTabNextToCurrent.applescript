#!/usr/bin/env osascript

-- Adapted from https://daringfireball.net/2018/12/safari_new_tab_next_to_current_tab
tell application "Safari"
	tell front window
		set _old_tab to current tab
		set _new_tab to make new tab at after _old_tab
		set current tab to _new_tab
		set URL of current tab to "favorites://"
	end tell
end tell
