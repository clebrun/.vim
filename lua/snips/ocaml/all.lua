local ls = require "luasnip"
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")

return {
	-- test expect
	s("txp", {
		t("let%expect_test = \""), i(1, "default"), t({ "\"" }),
		-- let x = test in
		-- Format.printf "%a@" (i().pp i()) x
		t({ "", "  " }), i(2),
		t({ "", "  [%expect {||}]" }), t({ "" }),
		t({ "", ";;" })
	}),
	-- derive show
	s("drs", { t("[@@deriving show]") }),
	-- other ideas:
	-- let module struct/sig
	-- common opens
	-- derived show based format.printf etc.
}
