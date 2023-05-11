require('harpoon').setup({
    projects = {
        ['~/onboarding/fury_rampup-wuilliam-lacruz'] = {
            term = {
                cmds = {
                    'go test ./...\n',
                    'fury run 21001\n',
                }
            },
        },
        ['~/work/fury_bari-transactor'] = {
            term = {
                cmds = {
                    'make test\n',
                    'make run\n',
                }
            },
        }
    },
})
