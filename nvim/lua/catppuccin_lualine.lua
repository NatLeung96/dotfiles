local colors  = {
    fg = '#1E1E2E',
    bg2 = '#11111B',
    bg3 = '#181825',

    red = '#F38BA8',
    green = '#A6E3A1',
    yellow = '#F9E2AF',
    blue = '#89B4FA',
    pink = '#F5C2E7',
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
                a = {bg = colors.blue, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.blue},
                c = {bg = colors.none, fg = colors.blue}
            },
            insert = {
                a = {bg = colors.pink, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.pink},
                c = {bg = colors.none, fg = colors.pink}
            },
            visual = {
                a = {bg = colors.yellow, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.yellow},
                c = {bg = colors.none, fg = colors.yellow}
            },
            replace = {
                a = {bg = colors.green, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.green},
                c = {bg = colors.none, fg = colors.green}
            },
            command = {
                a = {bg = colors.red, fg = colors.fg, gui = 'bold'},
                b = {bg = colors.none, fg = colors.red},
                c = {bg = colors.none, fg = colors.red}
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
