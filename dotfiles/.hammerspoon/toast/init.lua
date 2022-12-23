local toasts = {
  main = nil,
}

local function killToast(params)
  params = params or {}

  local name = params.name or "main"
  if toasts[name] ~= nil then
    hs.alert.closeSpecific(toasts[name], params.fadeOutDuration or 0.1)
    toasts[name] = nil
  end
end

return function(str, time, params)
  killToast(params)

  params = params or {}

  local name = params.name or "main"

  --[[ white = 49, ]]
  --[[ green = 50, ]]
  --[[ blue = 68, ]]
  --[[ red = 205, ]]
  --[[ green = 214, ]]
  --[[ blue = 244, ]]

  toasts[name] = hs.alert(str, {
    fillColor = {
      white = 0,
      alpha = 0.4,
    },
    strokeColor = { white = 0, alpha = 0 },
    strokeWidth = 0,
    textColor = {
      white = 1,
      alpha = 1,
    },
    radius = 0.3,
    padding = 6,
    textSize = 20,
    fadeInDuration = 0.1,
    fadeOutDuration = params.fadeoutduration or 0.1,
    atScreenEdge = 2,
  }, time or 1.5, hs.screen.mainScreen())

  --[[ toasts[name] = hs.alert(str, { ]]
  --[[   textSize = 14, ]]
  --[[   radius = 10, ]]
  --[[   padding = 6, ]]
  --[[   fadeInDuration = 0.1, ]]
  --[[   fadeOutDuration = params.fadeoutduration or 0.1, ]]
  --[[   atScreenEdge = 1, ]]
  --[[ }, time or 1.5, hs.screen.mainScreen()) ]]
end
