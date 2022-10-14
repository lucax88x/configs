local laptop = "37D8832A-2D66-02CA-B9F7-8F30A301B230"
local central = "8ED98897-AA63-402D-BB78-ED8F83F14117"
local left = "323C3D7C-7C00-470F-B971-1EACC9DD12E6"
local right = "1E62FBBF-7DE4-4B12-A75B-ACC9768CE480"
local office = "88D4DED5-4440-421F-AFF0-F1EF2AC57C49"

local my_displays = { laptop, central, left, right }
local fallback_display = laptop

local chat = "chat"
local code = "code"
local terminal = "terminal"
local browser = "browser"
local tools = "tools"
local email = "email"

local space_assignments = {
  [chat] = laptop,
  [code] = central,
  [browser] = left,
  [terminal] = left,
  [tools] = right,
  [email] = right,
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

local function get_displays_indexes(args, callback)
  yabai.display.get(function(retrieved_displays)
    local indexes = {}

    for _, display in pairs(retrieved_displays) do
      if utils.has_value(args, display.uuid) then
        indexes[display.uuid] = display.index
      else
        print(display.uuid, "not found")
      end
    end

    callback(indexes)
  end)
end

local function purge_empty_spaces(callback)
  yabai.space.get(function(spaces)
    local to_destroy_ids = {}

    for _, space in pairs(spaces) do
      if utils.is_empty(space.label) then
        table.insert(to_destroy_ids, space.id)
      end
    end

    utils.sequential(to_destroy_ids, function(to_find_space_id, next)
      yabai.space.get(function(loop_spaces)
        local found_space = utils.first(loop_spaces, function(space)
          return space.id == to_find_space_id
        end)

        if found_space == nil then
          print("cannot find space with id " .. to_find_space_id)
          next()
        else
          local space_index = found_space.index

          print("destroying space with id " .. found_space.id .. " index " .. space_index)

          yabai.space.destroy(space_index, function(error)
            if not utils.is_empty(error) then
              print(error)
            else
              print("destroyed space with index " .. space_index)
            end

            next()
          end)
        end
      end)
    end, function()
      if callback then
        callback()
      end
    end)
  end)
end

local function get_spaces_labels_indexes(callback)
  yabai.space.get(function(spaces)
    local indexes = {}

    for _, space in pairs(spaces) do
      if not utils.is_empty(space.label) then
        indexes[space.label] = { index = space.index, display = space.display }
      end
    end

    callback(indexes)
  end)
end

local function get_space_label_indexes(label, callback)
  yabai.space.get(function(spaces)
    for _, space in pairs(spaces) do
      if string.find(space.label, label) then
        callback({ index = space.index, display = space.display })
        return
      end
    end

    callback(nil)
  end)
end

local function correct_spaces(displays_indexes, callback)
  utils.sequential(space_assignments, function(space_assignment, next)
    local space_label, to_move_display_uuid = space_assignment.key, space_assignment.value

    print("space " .. space_label .. " should belong to display: " .. to_move_display_uuid)

    get_space_label_indexes(space_label, function(space_indexes)
      local to_move_display_index = displays_indexes[to_move_display_uuid]

      if to_move_display_index == nil then
        print("display " .. to_move_display_uuid .. " not found, using fallback " .. fallback_display)

        to_move_display_index = displays_indexes[fallback_display]
      end

      if space_indexes ~= nil then
        local current_space_index, current_display_index = space_indexes.index, space_indexes.display

        if current_display_index == to_move_display_index then
          print("space " .. space_label .. " is already in display: " .. to_move_display_index)

          next()
        else
          print(
            "space "
            .. space_label
            .. " is in display: "
            .. current_space_index
            .. " so we need to move to display: "
            .. to_move_display_index
          )

          yabai.space.move(current_space_index, to_move_display_index, function()
            print("space " .. space_label .. " moved to " .. to_move_display_index)

            next()
          end)
        end
      else
        print("space " .. space_label .. " to be created in display: " .. to_move_display_index)
        yabai.space.create(space_label, to_move_display_index, function()
          print("space " .. space_label .. " created in " .. to_move_display_index)

          next()
        end)
      end
    end)
  end, function()
    callback()
  end)
end

local function correct_windows(spaces_indexes)
  yabai.window.get(function(windows)
    for _, window in pairs(windows) do
      print("checking window " .. window.app)
      for app_identifier, to_move_space_label in pairs(app_spaces) do
        if not utils.is_empty(window.app) then
          if string.match(window.app, app_identifier) ~= nil then
            local space_indexes = spaces_indexes[to_move_space_label]

            if space_indexes ~= nil then
              local to_move_space_index = space_indexes.index

              if window.space == to_move_space_index then
                print("window " .. window.app .. " is already in space: " .. to_move_space_label)
              else
                print(
                  "window "
                  .. window.app
                  .. " is in space: "
                  .. window.space
                  .. " so we need to move to display: "
                  .. to_move_space_label
                )

                yabai.window.move(window.id, to_move_space_index, function()
                  print("window " .. window.app .. " moved to " .. to_move_space_label)
                end)
              end

              break
            end
          end
        end
      end
    end
  end)
end

purge_empty_spaces(function()
  print("purged all empty spaces")
  get_displays_indexes(my_displays, function(displays_indexes)
    correct_spaces(displays_indexes, function()
      print("corrected spaces")
      get_spaces_labels_indexes(function(updated_spaces_indexes)
        --correct_windows(updated_spaces_indexes)
      end)
    end)
  end)
end)
