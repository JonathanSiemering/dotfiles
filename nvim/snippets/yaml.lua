local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("httproute", {
        t({ "apiVersion: gateway.networking.k8s.io/v1", "kind: HTTPRoute", "metadata:", "  name: " }),
        i(1, "my-route"),
        t({ "", "  namespace: " }),
        i(2, "default"),
        t({ "", "spec:", "  parentRefs:", "    - name: " }),
        i(3, "my-gateway"),
        t({ "", "  rules:", "    - matches:", "        - path:", "            type: PathPrefix", "            value: " }),
        i(4, "/"),
        t({ "", "      backendRefs:", "        - name: " }),
        i(5, "my-service"),
        t({ "", "          port: " }),
        i(6, "80"),
    }),
}
