_G.hs = {
	logger = {
		new = function()
			return {
				i = function(m)
					print("INFO: " .. m)
				end,
			}
		end,
	},
}

local utils = require("utils")

describe("utils", function()
	describe("length", function()
		it("should give length of simple array", function()
			local result = utils.length({ 1, 2, "test" })
			assert.are.same(result, 3)
		end)

		-- it("should give length of string", function()
		--   local result = utils.length("test")
		--   assert.are.same(result, 4)
		-- end)
	end)

	describe("empty", function()
		it("should give true with empty array", function()
			local result = utils.is_empty({})
			assert.are.same(result, true)
		end)

		it("should give true with empty string", function()
			local result = utils.is_empty("")
			assert.are.same(result, true)
		end)

		it("should give true with empty table", function()
			local result = utils.is_empty({})
			assert.are.same(result, true)
		end)

		it("should give false with not empty array", function()
			local result = utils.is_empty({ 1, 2 })
			assert.are.same(result, false)
		end)

		it("should give false with not empty string", function()
			local result = utils.is_empty("test")
			assert.are.same(result, false)
		end)

		it("should give false with not empty table", function()
			local result = utils.is_empty({ { "key", 1 } })
			assert.are.same(result, false)
		end)
	end)

	describe("sequential", function()
		it("should call callback with empty", function()
			local counter = 0
			utils.sequential({}, function(_, loop)
				counter = counter + 1
				loop()
			end, function()
				assert.are.same(counter, 0)
			end)
		end)

		it("should call two next and should call callback with results", function()
			local counter = 0
			utils.sequential({ 1, 2 }, function(p, loop)
				counter = counter + 1
				loop(nil, "next " .. p)
			end, function(errors, results)
				assert.are.same(errors, {})
				assert.are.same(results, { "next 1", "next 2" })
				assert.are.same(counter, 2)
			end)
		end)

		it("should call two next and should call callback with errors", function()
			local counter = 0
			utils.sequential({ 1, 2 }, function(_, loop)
				counter = counter + 1
				loop("some error")
			end, function(errors, results)
				assert.are.same(errors, { "some error", "some error" })
				assert.are.same(results, {})
				assert.are.same(counter, 2)
			end)
		end)
	end)

	describe("starts_with_any", function()
		local test_data = { "Apple", "Banana", "cherry", "Grape" }

		it("should return true if the string starts with any string from the array (case-insensitive)", function()
			assert.is_true(utils.starts_with_any(test_data, "Apple"))
			assert.is_true(utils.starts_with_any(test_data, "apple"))
			assert.is_true(utils.starts_with_any(test_data, "App"))
			assert.is_true(utils.starts_with_any(test_data, "Apple 4"))
			assert.is_true(utils.starts_with_any(test_data, "appleappleapple"))
			assert.is_true(utils.starts_with_any(test_data, "Cherry"))
			assert.is_true(utils.starts_with_any(test_data, "cherry"))
		end)

		it(
			"should return false if the string does not start with any string from the array (case-insensitive)",
			function()
				assert.is_false(utils.starts_with_any(test_data, "peach"))
				assert.is_false(utils.starts_with_any(test_data, "ape"))
				assert.is_false(utils.starts_with_any(test_data, "Kiwi"))
			end
		)
	end)
end)
