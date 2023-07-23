local helpers = require("spec.helpers")

helpers.setDefault()

local spaces = require("spaces")
local ScreenBuilder = require("spec.mocks.hammerspoon.screen")
local SpaceBuilder = require("spec.mocks.hammerspoon.space")
local WindowBuilder = require("spec.mocks.hammerspoon.window")
local Window = require("spec.mocks.hammerspoon.window_instance")
local Application = require("spec.mocks.hammerspoon.application_instance")

describe("spaces", function()
	hs = helpers.resetMocks()

	describe("move_to_space", function()
		hs.screen = ScreenBuilder:new():withMainScreen(5):build()

		it("should return error if we cannot get spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, nil):build()

			-- when
			local _, error = spaces.move_to_space(5)

			-- then
			assert.are.same("cannot get spaces", error)
		end)

		it("should not move if cant find index", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, { 1 }):build()

			-- when
			local result, error = spaces.move_to_space(2)

			-- then
			assert.are.same("there's no space to move", error)
			assert.are.same(nil, result)
		end)

		it("should move", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, { 1, 2, 3 }):withGotoSpace(true, nil):build()

			-- when
			local result, error = spaces.move_to_space(3)

			-- then
			assert.are.same(nil, error)
			assert.are.same(true, result)
		end)
	end)

	describe("purge_empty_spaces", function()
		hs.screen = ScreenBuilder:new():withMainScreen(5):build()

		it("should return error if we cannot get spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withAllSpaces(nil):build()

			-- when
			local _, error = spaces.purge_empty_spaces()

			-- then
			assert.are.same("cannot get spaces", error)
		end)

		it("should purge nothing if only your space remains", function()
			-- given
			hs.spaces = SpaceBuilder:new():withAllSpaces({ "screen5-uuid", { 1 } }):withFocusedSpace(1):build()

			-- when
			local result, error = spaces.purge_empty_spaces()

			-- then
			assert.are.same(nil, error)
			assert.are.same({}, result)
		end)

		it("should skip if cannot remove specific space", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withAllSpaces({ "screen1-uuid", { 1, 2, 3 } })
				:withFocusedSpace(1)
				:withRemoveSpace(function(space_id, _)
					if space_id == 2 then
						return nil, "cannot remove!"
					end

					return true, nil
				end)
				:build()

			-- when
			local result, error = spaces.purge_empty_spaces()

			-- then
			assert.are.same(nil, error)
			assert.are.same({ 3 }, result)
		end)

		it("should purge all other spaces if they have no windows or they are special apps", function()
			-- given
			hs.spaces = SpaceBuilder
				:new()
				:withAllSpaces({ "screen1-uuid", { 1, 2, 3 }, "screen2-uuid", { 5, 8, 10 } })
				:withFocusedSpace(1)
				-- :withWindowsForSpace(1, { 10, 11, 12 })
				-- :withWindowsForSpace(2, { 20, 21, 22 })
				-- :withWindowsForSpace(8, { 80 })
				-- :withWindowsForSpace(10, { 100, 101 })
				:build()

			local all_windows_count = 0
			hs.window = WindowBuilder
				:new()
				:withAllWindows(function()
					if all_windows_count == 0 then
						all_windows_count = all_windows_count + 1

						return {
							Window:new(Application:new("app1")),
							Window:new(Application:new("app2")),
							Window:new(Application:new("app3")),
						}
					end

					if all_windows_count == 1 then
						all_windows_count = all_windows_count + 1

						return {
							Window:new(Application:new("app4")),
							Window:new(Application:new("app5")),
						}
					end

					if all_windows_count == 2 then
						all_windows_count = all_windows_count + 1

						return {
							Window:new(Application:new("rcmd")),
							Window:new(Application:new("Bartender 4")),
						}
					end
				end)
				-- :withWindow(11, Window:new(Application:new("app2")))
				-- :withWindow(12, Window:new(Application:new("app3")))
				-- :withWindow(21, Window:new(Application:new("app4")))
				-- :withWindow(80, Window:new(Application:new("app5")))
				-- :withWindow(100, Window:new(Application:new("rcmd")))
				-- :withWindow(101, Window:new(Application:new("Bartender 4")))
				-- :withAllWindows(101, Window:new(Application:new("Bartender 4")))
				:build()

			-- when
			spaces.purge_empty_spaces(function(result, error)
				assert.are.same(nil, error)
				assert.are.same({ 3, 5, 10 }, result)
			end)
		end)
	end)

	describe("purge_current_space", function()
		hs.screen = ScreenBuilder:new():withMainScreen(5):build()

		it("should not kill any and give error because no other spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, nil):build()

			-- when
			local _, error = spaces.purge_current_space()

			-- then
			assert.are.same("cannot get spaces", error)
		end)

		it("should not kill any and give error because no other spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, { 1 }):withFocusedSpace(1):build()

			-- when
			local _, error = spaces.purge_current_space()

			-- then
			assert.are.same("cannot kill because last space", error)
		end)

		it("should give error if cannot move to next", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(1)
				:withGotoSpace(nil, "cannot move!")
				:build()

			-- when
			local _, error = spaces.purge_current_space()

			-- then
			assert.are.same("cannot move!", error)
		end)

		it("should give error if cannot kill, even if it moves", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(1)
				:withGotoSpace(true, nil)
				:withRemoveSpace(function(space_id, _)
					if space_id == 1 then
						return nil, "cannot remove!"
					end

					return true, nil
				end)
				:build()

			-- when
			local _, error = spaces.purge_current_space()

			-- then
			assert.are.same("cannot remove!", error)
		end)

		it("should move to next space and kill current", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(1)
				:withGotoSpace(true, nil)
				:withRemoveSpace(function(_, _)
					return true, nil
				end)
				:build()

			-- when
			local result, error = spaces.purge_current_space()

			-- then
			assert.are.same(nil, error)
			assert.are.same(2, result)
		end)

		it("should focus to first space if we want to remove last space", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(2)
				:withGotoSpace(true, nil)
				:withRemoveSpace(function(_, _)
					return true, nil
				end)
				:build()

			-- when
			local result, error = spaces.purge_current_space()

			-- then
			assert.are.same(nil, error)
			assert.are.same(1, result)
		end)
	end)

	describe("create_space_and_move_current_window", function()
		hs.screen = ScreenBuilder:new():withMainScreen(5):build()

		it("wip", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, nil):build()

			-- when
			local _, error = spaces.create_space_and_move_current_window()

			-- then
			assert.are.same("cannot get spaces", error)
		end)
	end)
end)
