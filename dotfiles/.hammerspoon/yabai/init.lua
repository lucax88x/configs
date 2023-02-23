local log = hs.logger.new("yabai.init", "info")

local laptop = "37D8832A-2D66-02CA-B9F7-8F30A301B230"
local central = "8ED98897-AA63-402D-BB78-ED8F83F14117"
local left = "323C3D7C-7C00-470F-B971-1EACC9DD12E6"
local right = "1E62FBBF-7DE4-4B12-A75B-ACC9768CE480"
local office = "7DAEB631-FADB-4FD9-911A-89CCCC97799C"

local my_displays = { laptop, office }
local fallback_display = laptop

local chat = "chat"
local code = "code"
local terminal = "terminal"
local browser = "browser"
local tools = "tools"
local email = "email"

local space_assignments = {
  [chat] = laptop,
  [code] = office,
  [browser] = office,
  [terminal] = laptop,
  [tools] = office,
  [email] = office,
}

local app_spaces = {
  ["Google Chrome"] = browser,
  ["JetBrains Rider"] = code,
  ["kitty"] = terminal,
  ["WhatsApp"] = chat,
  ["Slack"] = chat,
  ["Microsoft Teams"] = chat,
  ["Telegram"] = chat,
  ["Microsoft Outlook"] = email,
  ["Mail"] = email,
  ["DataGrip"] = tools,
  ["Docker Desktop"] = tools,
  ["Postman"] = tools,
  ["Sublime Merge"] = tools,
}

local yabai = require("yabai.api")
local utils = require("utils")
local yabai_helper = require("yabai.helper")

local function get_displays_indexes(args, callback)
  yabai.display.get_all(function(error, retrieved_displays)
    if not utils.is_empty(error) then
      callback(error, nil)
    end

    local indexes = {}

    for _, display in pairs(retrieved_displays) do
      if utils.has_value(args, display.uuid) then
        indexes[display.uuid] = display.index
      else
        log.i(display.uuid, "not found")
      end
    end

    callback(nil, indexes)
  end)
end

local function get_space_label_indexes(label, callback)
  yabai.space.get_all(function(error, spaces)
    if not utils.is_empty(error) then
      callback(error, nil)
    end

    for _, space in pairs(spaces) do
      if string.find(space.label, label) then
        callback({ index = space.index, display = space.display })
        return
      end
    end

    callback(nil, nil)
  end)
end

local function correct_spaces(displays_indexes, callback)
  utils.sequential(space_assignments, function(space_assignment, next)
    local space_label, to_move_display_uuid = space_assignment.key, space_assignment.value

    log.i("space " .. space_label .. " should belong to display: " .. to_move_display_uuid)

    get_space_label_indexes(space_label, function(space_indexes)
      local to_move_display_index = displays_indexes[to_move_display_uuid]

      if to_move_display_index == nil then
        log.i("display " .. to_move_display_uuid .. " not found, using fallback " .. fallback_display)

        to_move_display_index = displays_indexes[fallback_display]
      end

      if space_indexes ~= nil then
        local current_space_index, current_display_index = space_indexes.index, space_indexes.display

        if current_display_index == to_move_display_index then
          log.i("space " .. space_label .. " is already in display: " .. to_move_display_index)

          next()
        else
          log.i(
            "space "
            .. space_label
            .. " is in display: "
            .. current_space_index
            .. " so we need to move to display: "
            .. to_move_display_index
          )

          yabai.space.move(current_space_index, to_move_display_index, function(error)
            if not utils.is_empty(error) then
              log.e(error)
            else
              log.i("space " .. space_label .. " moved to " .. to_move_display_index)
            end

            next()
          end)
        end
      else
        log.i("space " .. space_label .. " to be created in display: " .. to_move_display_index)
        yabai.space.create(space_label, to_move_display_index, function(error)
          if not utils.is_empty(error) then
            log.e(error)
          else
            log.i("space " .. space_label .. " created in " .. to_move_display_index)
          end
          next()
        end)
      end
    end)
  end, function()
    callback()
  end)
end

yabai_helper.purge_empty_spaces(function(errors, results)
  if not utils.is_empty(errors) then
    log.e("errors: " .. utils.stringify(errors))
  else
    log.i("results: " .. utils.stringify(results))

    get_displays_indexes(my_displays, function(display_indexs_error, displays_indexes)
      if not utils.is_empty(display_indexs_error) then
        log.e(display_indexs_error)
      else
        correct_spaces(displays_indexes, function(correct_spaces_error)
          if not utils.is_empty(correct_spaces_error) then
            log.e(correct_spaces_error)
          else
            log.i("corrected spaces")
          end
        end)
      end
    end)
  end
end)
