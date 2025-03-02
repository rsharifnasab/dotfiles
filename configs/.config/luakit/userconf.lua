--- userconf.lua

local modes = require("modes")

modes.add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})
