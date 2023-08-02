local screen_api = require("screen.api")

local M = {}

function M.full_screen()
  local window = hs.window.focusedWindow()
  window:setFullScreen(not window:isFullScreen())
end

function M.maximize()
  local window = hs.window.focusedWindow()
  window:maximize(0)
end

function M.minimize()
  local window = hs.window.focusedWindow()
  window:minimize()
end

function M.close()
  local window = hs.window.focusedWindow()
  window:close()
end

function M.window_size(x, y, w, h)
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local f = win:frame()
  local max = win:screen():frame()

  f.w = math.floor(max.w * w)
  f.h = math.floor(max.h * h)
  f.x = math.floor((max.w * x) + max.x)
  f.y = math.floor((max.h * y) + max.y)

  win:setFrame(f)
end

local function get_good_focused_window(nofull)
  local win = hs.window.focusedWindow()
  if not win or not win:isStandard() then
    return
  end
  if nofull and win:isFullScreen() then
    return
  end
  return win
end

-- test and improve
function M.move_window_one_space(dir)
  local win = get_good_focused_window(true)
  if not win then
    return
  end
  local screen = win:screen()
  local uuid = screen:getUUID()
  local userSpaces = nil
  for k, v in pairs(hs.spaces.allSpaces()) do
    userSpaces = v
    if k == uuid then
      break
    end
  end
  if not userSpaces then
    return
  end
  local thisSpace = hs.spaces.windowSpaces(win) -- first space win appears on
  if not thisSpace then
    return
  else
    thisSpace = thisSpace[1]
  end
  local last = nil
  local skipSpaces = 0
  for _, spc in ipairs(userSpaces) do
    if hs.spaces.spaceType(spc) ~= "user" then -- skippable space
      skipSpaces = skipSpaces + 1
    else
      if last and ((dir == "left" and spc == thisSpace) or (dir == "right" and last == thisSpace)) then
        local newSpace = (dir == "left" and last or spc)
        hs.spaces.moveWindowToSpace(win, newSpace)
        hs.spaces.gotoSpace(newSpace)
        return
      end
      last = spc -- Haven't found it yet...
      skipSpaces = 0
    end
  end

  screen_api.flash(screen) -- Shouldn't get here, so no space found
end

return M
