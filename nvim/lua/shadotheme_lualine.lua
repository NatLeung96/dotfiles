local colors  = {
    fg = '#09090D',
    normal = '#E95676',
    insert = '#4654B3',
    visual = '#6546E0',
    replace = '#DB3567',
    command = '#BD93F9',
}

-- Add Symbol For Your Distro Here
local function distro()
    return [[󰣇 ]]
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = {
            normal = {
                a = {bg = colors.normal, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.normal},
                c = {bg = colors.none, fg = colors.normal}
            },
            insert = {
                a = {bg = colors.insert, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.insert},
                c = {bg = colors.none, fg = colors.insert}
            },
            visual = {
                a = {bg = colors.visual, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.visual},
                c = {bg = colors.none, fg = colors.visual}
            },
            replace = {
                a = {bg = colors.replace, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.replace},
                c = {bg = colors.none, fg = colors.replace}
            },
            command = {
                a = {bg = colors.command, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.command},
                c = {bg = colors.none, fg = colors.command}
            },
            inactive = {
                a = {bg = colors.bg4, fg = colors.fg3, gui = 'bold'},
                b = {bg = colors.bg4, fg = colors.fg3},
                c = {bg = colors.bg4, fg = colors.fg3}
            }
        },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'searchcount', 'diagnostics', 'filetype', { distro } },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
