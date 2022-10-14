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

  --local toast = toasts[name]
  toasts[name] = hs.alert(str, {
    fillcolor = { white = 0, alpha = 0.4 },
    strokecolor = { white = 0, alpha = 0 },
    strokewidth = 0,
    textcolor = { white = 1, alpha = 1 },
    radius = 0,
    padding = 6,
    atscreenedge = 0,
    fadeinduration = 0.1,
    fadeoutduration = params.fadeoutduration or 0.1,
  }, time or 1.5)
end
