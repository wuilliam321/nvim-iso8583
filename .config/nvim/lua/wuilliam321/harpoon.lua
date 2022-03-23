require("harpoon").setup({
    projects = {
        ["~/w/partner-portal-web"] = {
            term = {
                cmds = {
                    "npm run unit\n",
                    "nvm use 10.16.3 && npm run local\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/items-management-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/vp-users-management-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/vendor-portal-ssu-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/w/shopper-balance-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/p/katas/design-patterns"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make build\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/items-catalogue-management-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/workspace/shein_automation"] = {
            term = {
                cmds = {
                    "gradle test\n",
                    "gradle build\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/portal-users-migration-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/product-availability-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/schedule-management-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/pedidosya/opening-times-adapter-service"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
        ["~/go/src/github.com/deliveryhero/dh-vt-kratos/go-services/vendor-onboarding"] = {
            term = {
                cmds = {
                    "make test\n",
                    "make web\n"
                }
            }
        },
    }
})

