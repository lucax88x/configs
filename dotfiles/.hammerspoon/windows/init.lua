local M = {}

hs.window.animationDuration = 0

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

return M
