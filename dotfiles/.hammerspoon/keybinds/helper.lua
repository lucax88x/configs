local shift = "shift"
local option = "option"
local command = "command"
local control = "control"

local M = {
  modifiers = {
    ["shift"] = { shift },
    ["alt"] = { option },
    ["option"] = { option },
    ["command"] = { command },
    ["control"] = { control },
    ["super"] = { command, control },
    ["alt_shift"] = { option, shift },
  },
}

function M.init(actions)
  local choices = {}
  local mapped_actions = {}
  for _, action in ipairs(actions) do
    if action.bind ~= nil then
      local modifiers = action.bind[1]
      local key = action.bind[2]

      hs.hotkey.bind(modifiers, hs.keycodes.map[key], nil, action.action)
    end

    table.insert(choices, { text = action.text, subText = action.description, action = action.text })
    mapped_actions[action.text] = action.action
  end

  local mainChooser = hs.chooser
      .new(function(option)
        if option ~= nil then
          local action = mapped_actions[option.text]
          if action ~= nil then
            action()
          end
        end
      end)
      :choices(choices)

  hs.hotkey.bind(M.modifiers.super, hs.keycodes.map["return"], nil, function()
    mainChooser:show()
  end)
end

return M
