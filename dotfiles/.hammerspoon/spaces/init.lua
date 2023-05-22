local utils = require("utils")
local log = hs.logger.new("spaces.init", "info")

local M = {}

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

function M.purge_empty_spaces()
	local focused_space_id = hs.spaces.focusedSpace()
	local all_spaces = hs.spaces.allSpaces()

	if all_spaces == nil then
		return nil, "cannot get spaces"
	end

	-- hs.spaces.windowSpaces
	local purged_space_ids = {}

	for screen_uuid, spaces in pairs(all_spaces) do
		log:i("in screen " .. screen_uuid)
		for _, space_id in ipairs(spaces) do
			if space_id == focused_space_id then
				log:i("keeping current space " .. space_id)
			else
				log:i("purging space " .. space_id)

				local _, remove_err = hs.spaces.removeSpace(space_id, false)

				if remove_err == nil then
					table.insert(purged_space_ids, space_id)
				else
					log:i("cannot purge space " .. space_id .. " because " .. remove_err)
				end
			end
		end
	end

	return purged_space_ids, nil
	--
end

function M.create_space_and_move_current_window()
	local main_screen = hs.screen.mainScreen()
	local main_screen_uuid = main_screen:getUUID()
	local all_spaces = hs.spaces.allSpaces()

	if hs.spaces.addSpaceToScreen(main_screen_uuid, true) then
		local space_index = utils.length(all_spaces) - 1
		log:i("moving to space " .. space_index)

		M.move_current_window_to_space(main_screen_uuid, space_index)
	else
		log:e("cannot create space")
	end
end

function M.move_current_window_to_space(screen_uuid, space_index)
	local win = hs.window.focusedWindow()
	local all_spaces = hs.spaces.allSpaces()
	local space_uuid = all_spaces[screen_uuid][space_index]
	-- if space_uuid is nil then
	-- end
	hs.spaces.moveWindowToSpace(win:id(), space_uuid)
	hs.spaces.gotoSpace(space_uuid) -- follow window to new space
end

function M.kill_current_space()
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
		return nil, move_err
	end

	log:i("removing space " .. focused_space_id)

	local _, remove_err = hs.spaces.removeSpace(focused_space_id, false)

	if remove_err == nil then
		return to_focus_space_id, nil
	else
		log:e("cannot remove space" .. remove_err)
		return nil, remove_err
	end
end

return M
