local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui'}

local colors = {
  bg = '#282828',
  fg = '#a89984',
  section_bg = '#38393f',
  yellow = '#d79921',
  cyan = '#83a598',
  green = '#b8bb26',
  orange = '#fe8019',
  purple = '#b16286',
  magenta = '#d3869b',
  blue = '#83a598';
  red = '#fb4934';

}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local mode_color = function()
  local mode_colors = {
    n = colors.blue,
    i = colors.green,
    c = colors.orange,
    V = colors.purple,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  return mode_colors[vim.fn.mode()]
end

local mode_alias = function()
  local mode_map = {
     n = 'N',
     i = 'I',
     R = 'R',
     v = 'V',
     V = 'VL',
     ["<C-v>"]= 'VB',
     c = 'C',
     s = 'S',
     S = 'SL',
     ["<C-s>"] = 'SB',
     t= 'T',
  }

  return mode_map[vim.fn.mode()]
end


gls.left = {
  {
    Start = {
      provider = function() return '▊ ' end,
      highlight = {colors.fg,colors.bg}
    },
  },
  {
    ViMode = {
      provider = function()
        vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
        return ' ' .. mode_alias() .. ' '
      end,
      icon = '',
      highlight = { colors.bg, colors.bg },
      separator = "  ",
      separator_highlight = {colors.bg, colors.section_bg},
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.section_bg},
    },
  },
  {
     FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator = " ",
      separator_highlight = {colors.section_bg, colors.bg},
    }
  },
  {
     FileSize = {
      provider = 'FileSize',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.bg },
      separator = " ",
      separator_highlight = {colors.bg, colors.section_bg},
    }
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = ' ',
      highlight = {colors.red,colors.section_bg}
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = ' ',
      highlight = {colors.yellow,colors.section_bg},
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = ' ',
      highlight = {colors.cyan,colors.section_bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = ' ',
      highlight = {colors.blue,colors.section_bg},
      separator = ' ',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  },
}

gls.right= {
  {
    GitIcon = {
      provider = function() return ' ' end,
      condition = require('galaxyline.provider_vcs').check_git_workspace,
      highlight = {colors.red,colors.section_bg},
      separator = '',
      separator_highlight = { colors.section_bg,colors.bg },
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      condition = require('galaxyline.provider_vcs').check_git_workspace,
      highlight = {colors.fg,colors.section_bg},
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = '  ',
      highlight = {colors.green,colors.section_bg},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = ' 柳',
      highlight= {colors.orange,colors.section_bg},
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = '  ',
      highlight = {colors.red,colors.section_bg},
      separator = ' ',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  },
  {
    FileEncode = {
      provider = 'FileEncode',
      highlight = {colors.cyan,colors.bg,'bold'},
      separator = ' ',
      separator_highlight = {colors.section_bg, colors.bg},
    }
  },
  {
    FileFormat = {
      provider = 'FileFormat',
      highlight = {colors.cyan,colors.bg,'bold'},
      separator_highlight = {colors.bg, colors.bg},
      separator = ' ',
    }
  },
  {
    LineInfo = {
      provider = 'LineColumn',
      highlight = {colors.fg,colors.bg},
      separator_highlight = {colors.bg, colors.bg},
      separator = ' ',
    },
  }
}



--[[ gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {colors.white,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}  ]]