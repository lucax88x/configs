RCMD_SCRIPT_VERSION = 0.21

RCMD_LOG_TMP_DIR = "/tmp/rcmd-script-logs"
hs.fs.mkdir(RCMD_LOG_TMP_DIR)

function rcmdMap(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function rcmdFilter(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        if f(v) then
            t[k] = v
        end
    end
    return t
end

function rcmdFilterArray(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        if f(v) then
            table.insert(t, v)
        end
    end
    return t
end

function rcmdWindowsChangedFocused(window, app, event)
    rcmdLastFocusedWindow = rcmdFocusedWindow
    if window then
        rcmdFocusedWindow = window
    end
    if rcmdFocusedWindow then
        server:send(tostring(rcmdFocusedWindow:id()))
    end

    rcmdWindowsAll = rcmdFilterArray(rcmdWFAll:getWindows(), function(w) return string.len(w:title()) > 0 end)

    for k, w in pairs(rcmdWindowsAll) do
        rcmdWindowsByID[w:id()] = w
    end
end

function rcmdEncodeWindow(window, focusedID)
    local id = window:id()
    local app = window:application()
    if not app then
        return {title=window:title(), id=id, bundleIdentifier="", focused=(id == focusedID)}
    end
    return {title=window:title(), id=id, bundleIdentifier=app:bundleID(), focused=(id == focusedID)}
end

function rcmdJSON(windows)
    local focusedID = 0
    if rcmdFocusedWindow then
        focusedID = rcmdFocusedWindow:id()
    end

    return hs.json.encode(rcmdMap(windows, function(w) return rcmdEncodeWindow(w, focusedID) end))
end

function rcmdWindowsChangedAll(window, app, event)
    rcmdRefetchWindows()
end

function rcmdRefetchWindows()
    rcmdWindowsAll = rcmdFilterArray(rcmdWFAll:getWindows(), function(w) return string.len(w:title()) > 0 end)

    for k, w in pairs(rcmdWindowsAll) do
        rcmdWindowsByID[w:id()] = w
    end

    server:send(rcmdJSON(rcmdWindowsAll))
end

function rcmdWindowsChanged(window, app, event)
    local wfilter = rcmdWF[app]
    if not wFilter then
        return
    end
    rcmdWindows[app] = rcmdFilterArray(wfilter:getWindows(), function(w) return string.len(w:title()) > 0 end)
end

function getApp(params)
    if params.pid then
        return hs.application.applicationForPID(params.pid)
    end
    return params.app
end

function getWindowFilter(params)
    if params.pid then
        params.app = hs.application.applicationForPID(params.pid):name()
    end

    local filters = {allowRoles={"AXFloatingWindow", "AXStandardWindow", "AXSystemDialog", "AXSystemFloatingWindow", "AXDialog"}}

    if params.unfocused then
        filters.focused = false
    end
    if params.app == nil or params.app == '' then
        return nil, nil
    end

    if rcmdWF[params.app] == nil then
        local f = hs.window.filter.new{[params.app] = filters}
        f:setSortOrder(hs.window.filter.sortByFocusedLast)
        f:subscribe(hs.window.filter.windowsChanged, rcmdWindowsChanged)
        rcmdWindows[params.app] = f:getWindows()
        rcmdWF[params.app] = f
    end
    return rcmdWF[params.app], rcmdWindows[params.app]
end

function rcmdCallbackWS(message)
    local msg = message
    if msg == nil or msg == '' then
        msg = "{}"
    end
    local params = hs.json.decode(msg)
    if not params.token or params.token ~= "1ffa4afd8206f4c99bef61df9699be029f7ea1d9" then
        return "Unauthorized"
    end

    if params.cmd == "reload" then
        hs.reload()
        return '{}'
    elseif params.cmd == "minimize" then
        local w = rcmdFocusedWindow
        if w then
            w:minimize()
        end
        return "{}"
    elseif params.cmd == "minimizeothers" then
        local w = rcmdFocusedWindow
        if not w then
            return '{"error": "NOAPP"}'
        end
        local wid = w:id()

        for _ in pairs({1, 2}) do
            local wf, windows = getWindowFilter(params)

            if not wf then
                return '{"error": "NOAPP"}'
            end

            for _, minw in ipairs(windows) do
                if minw:id() ~= wid then
                    minw:minimize()
                end
            end
        end
        return "{}"
    elseif params.cmd == "minimizeall" then
        local app = getApp(params)
        local wf, windows = getWindowFilter(params)

        if not wf then
            if app then
                app:selectMenuItem("Minimi[sz]e\\s+[aA]ll.*", true)
            end
            return '{"error": "NOAPP"}'
        end

        local mainW = windows[1]
        local alreadyMinimized = hs.fnutils.every(windows, function(w) return w:isMinimized() end)
        if app then
            if alreadyMinimized then
                if mainW then
                    mainW:unminimize()
                end

                app:activate(true)
                if app:findMenuItem("Arrange [iI]n [Ff]ront", true) then
                    app:selectMenuItem("Arrange [iI]n [Ff]ront", true)
                end
            else
                if app:findMenuItem("Minimi[sz]e\\s+[aA]ll.*", true) then
                    app:selectMenuItem("Minimi[sz]e\\s+[aA]ll.*", true)
                end
            end
            windows = wf:getWindows()
        end

        for _, minw in ipairs(windows) do
            if alreadyMinimized then
                if minw:isMinimized() then
                    minw:unminimize()
                end
            else
                if not minw:isMinimized() then
                    minw:minimize()
                end
            end
        end

        if alreadyMinimized and mainW then
            mainW:focus()
        end

        return "{}"
    elseif params.cmd == "launch" then
        if params.app then
            if params.args then
                local t = hs.task.new(
                    params.app,
                    function(exitCode, stdOut, stdErr)
                        if params.name then
                            io.open(RCMD_LOG_TMP_DIR .. "/" .. params.name, "w"):write(tostring(exitCode) .. "\n" .. stdOut .. "\n" .. stdErr):close()
                        end
                    end,
                    params.args)
                t:start()
            else
                local t = hs.task.new(
                    params.app,
                    function(exitCode, stdOut, stdErr)
                        if params.name then
                            io.open(RCMD_LOG_TMP_DIR .. "/" .. params.name, "w"):write(tostring(exitCode) .. "\n" .. stdOut .. "\n" .. stdErr):close()
                        end
                    end)
                t:start()
            end
        end
        return '{}'
    elseif params.cmd == "allwindows" then
        return rcmdJSON(rcmdWindowsAll, focusedID)
    elseif params.cmd == "windows" then
        local wf, windows = getWindowFilter(params)
        if not wf then
            return '{"error": "NOAPP"}'
        end

        local response = rcmdJSON(windows)

        return response
    elseif params.cmd == "focus" then
        if params.windowIndex == 0 then
            local w = rcmdLastFocusedWindow
            if w then
                if w:isMinimized() then
                    w:unminimize()
                end
                w:focus()
                return rcmdEncodeWindow(w, w:id())
            end
            return "{}"
        end

        if params.windowIndex then
            wf, windows = getWindowFilter(params)
            if not wf then
                return '{"error": "NOAPP"}'
            end

            local w = windows[params.windowIndex]
            if w == nil then
                return '{"error": "NOWINDOW"}'
            end
            if w:isMinimized() then
                w:unminimize()
            end
            w:focus()
            return rcmdEncodeWindow(w, w:id())
        end

        if params.window == nil or params.window == '' then
            return '{"error": "NOWINDOW"}'
        end

        local w = rcmdWindowsByID[params.window]
        if not w then
            w = hs.window.get(params.window)
        end
        if w == nil then
            return '{"error": "NOWINDOW"}'
        end
        rcmdWindowsByID[params.window] = w
        if w:isMinimized() then
            w:unminimize()
        end
        w:focus()
    end

    return "{}"
end

function rcmdCallback(method, path, headers, data)
    local body = data
    if body == nil or body == '' then
        body = "{}"
    end
    local params = hs.json.decode(body)
    params.cmd = string.sub(path, 2)

    return rcmdCallbackWS(hs.json.encode(params)), 200, {["Content-Type"] = "application/json"}
end

rcmdWFAll = hs.window.filter.new{default={allowRoles={"AXFloatingWindow", "AXStandardWindow", "AXSystemDialog", "AXSystemFloatingWindow", "AXDialog"}}}
rcmdWFAll:setSortOrder(hs.window.filter.sortByFocusedLast)
rcmdWFAll:subscribe(hs.window.filter.windowsChanged, rcmdWindowsChangedAll)
rcmdWFAll:subscribe(hs.window.filter.windowTitleChanged, rcmdWindowsChangedAll)

rcmdWindowsAll = rcmdWFAll:getWindows()
rcmdLastFocusedWindow = hs.window.focusedWindow()
rcmdFocusedWindow = hs.window.focusedWindow()
rcmdWFAll:subscribe(hs.window.filter.windowFocused, rcmdWindowsChangedFocused)

rcmdWF = {}
rcmdWindows = {}
rcmdWindowsByID = {}

screenWatcher = hs.screen.watcher.new(function(screenChanged)
    rcmdRefetchWindows()
end)
screenWatcher:start()
spaceWatcher = hs.spaces.watcher.new(function(space)
    rcmdRefetchWindows()
end)
spaceWatcher:start()

server = hs.httpserver.new(false, false)
server:setName("rcmd-hammerspoon")
server:setInterface("localhost")
server:setPort(3094)
server:setCallback(rcmdCallback)
server:websocket("/ws", rcmdCallbackWS)
server:start()
