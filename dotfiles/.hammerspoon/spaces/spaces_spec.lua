local helpers = require("spec.helpers")

helpers.setDefault()

local spaces = require("spaces.init")
local ScreenBuilder = require("spec.mocks.hammerspoon.screen")
local SpaceBuilder = require("spec.mocks.hammerspoon.space")

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
			hs.spaces = SpaceBuilder
				:new()
				:withAllSpaces({ "screen1-uuid", { 1, 2, 3 } })
				:withFocusedSpace(1)
				-- how to argument assert?
				:withRemoveSpace(nil, "cannot remove!")
				:build()

			-- when
			local result, error = spaces.purge_empty_spaces()

			-- then
			assert.are.same(nil, error)
			assert.are.same({ 2 }, result)
		end)

		it("should purge all other spaces if they have no windows", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withAllSpaces({ "screen1-uuid", { 1, 2, 3 }, "screen2-uuid", { 5, 8, 10 } })
				:withFocusedSpace(1)
				:build()

			-- when
			local result, error = spaces.purge_empty_spaces()

			-- then
			assert.are.same(nil, error)
			assert.are.same({ 2, 3, 5, 8, 10 }, result)
		end)
	end)

	describe("kill_current_space", function()
		hs.screen = ScreenBuilder:new():withMainScreen(5):build()

		it("should not kill any and give error because no other spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, nil):build()

			-- when
			local _, error = spaces.kill_current_space()

			-- then
			assert.are.same("cannot get spaces", error)
		end)

		it("should not kill any and give error because no other spaces", function()
			-- given
			hs.spaces = SpaceBuilder:new():withSpacesForScreen(5, { 1 }):withFocusedSpace(1):build()

			-- when
			local _, error = spaces.kill_current_space()

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
			local _, error = spaces.kill_current_space()

			-- then
			assert.are.same("cannot move!", error)
		end)

		it("should give error if cannot kill, even if it moves", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(1)
				:withGotoSpace(true, nil)
				:withRemoveSpace(nil, "cannot remove!")
				:build()

			-- when
			local _, error = spaces.kill_current_space()

			-- then
			assert.are.same("cannot remove!", error)
		end)

		it("should move to next space and kill current", function()
			-- given
			hs.spaces = SpaceBuilder:new()
				:withSpacesForScreen(5, { 1, 2 })
				:withFocusedSpace(1)
				:withGotoSpace(true, nil)
				:withRemoveSpace(true, nil)
				:build()

			-- when
			local result, error = spaces.kill_current_space()

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
				:withRemoveSpace(true, nil)
				:build()

			-- when
			local result, error = spaces.kill_current_space()

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
