local utils = require("utils")
local log = hs.logger.new("spaces.init", "info")

local M = {}

local window_wait_time_in_seconds = 0.5

local function can_we_drop_window(window)
	log:i("checking window " .. window:id())

	local application_title = window:application():title()

	if utils.starts_with_any({ "rcmd", "bartender" }, application_title) then
		return true
	end

	log:i("we cannot drop because title " .. application_title)
	return false
end

local function is_current_space_empty()
	local space_windows = hs.window.allWindows()

	local has_at_least_one_window = false
	if space_windows ~= nil then
		for _, window in ipairs(space_windows) do
			if not can_we_drop_window(window) then
				has_at_least_one_window = true
				break
			end
		end
	end

	return has_at_least_one_window
end

function M.move_to_space(space_index)
	local screen = hs.screen.mainScreen()
	local space_ids = hs.spaces.spacesForScreen(screen:id())

	if space_ids == nil then
		return nil, "cannot get spaces"
	end

	if utils.length(space_ids) < space_index then
		return nil, "there's no space to move"
	end

	local _, move_err = hs.spaces.gotoSpace(space_ids[space_index])

	if move_err ~= nil then
		log:e("cannot focus space" .. move_err)
		return nil, move_err
	end

	return true, nil
end

function M.purge_empty_spaces(callback)
	local focused_space_id = hs.spaces.focusedSpace()
	local all_spaces = hs.spaces.allSpaces()

	if all_spaces == nil then
		return callback(nil, "cannot get spaces")
	end

	local purged_space_ids = {}
	local to_purge_space_ids = {}
	local finished = false
	local recursions = 0

	local function check_spaces_recursively(spaces, index)
		log:i("checking " .. utils.length(spaces) .. ":" .. index)

		if utils.length(spaces) <= index then
			log:i("finish the recursion")
			finished = true
			return
		end

		local space_id = spaces[index]

		log:i("in space " .. space_id)

		if space_id == focused_space_id then
			log:i("we cannot purge current focused space " .. space_id)
		else
			local _, goto_err = hs.spaces.gotoSpace(space_id)

			if goto_err == nil then
				if not is_current_space_empty() then
					table.insert(to_purge_space_ids, space_id)
				else
					log:i("cannot purge space " .. space_id .. " because is not empty!")
				end
			else
				log:i("cannot move to space " .. space_id .. " because " .. goto_err)
			end
		end

		hs.timer.doAfter(window_wait_time_in_seconds, function()
			check_spaces_recursively(spaces, index + 1)
		end)
	end

	local spaces_to_check = {}
	for screen_uuid, spaces in pairs(all_spaces) do
		log:i("in screen " .. screen_uuid)

		log:i(utils.stringify(spaces))
		utils.concat(spaces_to_check, spaces)
		log:i(utils.stringify(all_spaces))
	end

	check_spaces_recursively(spaces_to_check, 1)

	hs.timer.waitUntil(function()
		if finished or recursions >= 50 then
			return true
		end
		return false
	end, function()
		log:i("finished waiting and moving back to " .. focused_space_id)

		local _, goto_err = hs.spaces.gotoSpace(focused_space_id)

		hs.timer.doAfter(window_wait_time_in_seconds, function()
			if goto_err == nil then
				for _, to_purge_space_id in ipairs(to_purge_space_ids) do
					log:i("purging space " .. to_purge_space_id)

					local _, remove_err = hs.spaces.removeSpace(to_purge_space_id, true)
					-- local remove_err = "some err"

					if remove_err == nil then
						table.insert(purged_space_ids, to_purge_space_id)
					else
						log:i("cannot purge space " .. to_purge_space_id .. " because " .. remove_err)
					end
				end
			else
				log:i("cannot move to original space " .. focused_space_id .. " because " .. goto_err)
			end

			callback(purged_space_ids, nil)
		end)
	end, 1)

	--
end

function M.create_space_and_move_current_window(callback)
	local main_screen = hs.screen.mainScreen()
	local main_screen_uuid = main_screen:getUUID()

	if hs.spaces.addSpaceToScreen(main_screen_uuid, true) then
		hs.timer.doAfter(window_wait_time_in_seconds, function()
			local all_spaces = hs.spaces.allSpaces()

			local space_index = utils.length(all_spaces[main_screen_uuid])

			log:i("moving to space " .. space_index)

			local win = hs.window.focusedWindow()

			local space_uuid = all_spaces[main_screen_uuid][space_index]

			hs.spaces.moveWindowToSpace(win:id(), space_uuid)
			hs.spaces.gotoSpace(space_uuid) -- follow window to new space

			hs.timer.doAfter(window_wait_time_in_seconds, function()
				callback(space_uuid, nil)
			end)
		end)
	else
		callback(nil, "cannot create space")
	end
end

function M.purge_current_space(callback)
	local screen = hs.screen.mainScreen()
	local space_ids = hs.spaces.spacesForScreen(screen:id())

	if space_ids == nil then
		return nil, "cannot get spaces"
	end

	local spaces_length = utils.length(space_ids)

	if spaces_length == 1 then
		return nil, "cannot kill because last space"
	end

	local focused_space_id = hs.spaces.focusedSpace()
	local focused_space_index = utils.find_index(space_ids, focused_space_id)

	local to_focus_space_id = nil

	if focused_space_index < spaces_length then
		to_focus_space_id = space_ids[focused_space_index + 1]
	else
		to_focus_space_id = space_ids[1]
	end

	if to_focus_space_id == nil then
		return nil, "cannot find next space to move"
	end

	log:i("focusing space " .. to_focus_space_id)

	local _, move_err = hs.spaces.gotoSpace(to_focus_space_id)

	if move_err ~= nil then
		log:e("cannot focus space" .. move_err)
		callback(nil, move_err)
		return
	end

	hs.timer.doAfter(window_wait_time_in_seconds, function()
		log:i("removing space " .. focused_space_id)

		local _, remove_err = hs.spaces.removeSpace(focused_space_id, false)

		if remove_err == nil then
			callback(to_focus_space_id, nil)
		else
			log:e("cannot remove space" .. remove_err)
			callback(nil, remove_err)
		end
	end)
end

return M
