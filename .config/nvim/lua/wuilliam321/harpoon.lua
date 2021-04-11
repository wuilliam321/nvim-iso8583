require("harpoon").setup({
    projects = {
        ["/Users/wuilliam.lacruz/p/capijzo-extension"] = {
            term = {
                cmds = {
                    "yarn test\n",
                    "yarn start\n",
                }
            }
        },
        ["/Users/wuilliam.lacruz/go/src/github.com/pedidosya/items-management-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        }
    }
})
