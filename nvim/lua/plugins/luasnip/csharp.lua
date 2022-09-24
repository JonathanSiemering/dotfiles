local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local filetype = "cs"

ls.add_snippets(filetype, {
    s("prop", {
        t("public "), i(1, "type"), t(" "), i(2, "name"), t(" { get; set; }")
    })
})
