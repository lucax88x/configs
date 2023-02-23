_G.hs = { logger = { new = function()
end } }

local utils = require("utils")

describe("utils", function()
  describe("stringify_array", function()
    it("should stringify simple array", function()
      local result = utils.stringify_array({ 1, 2, "test" })
      assert.are.same(result, "1,2,test")
    end)
  end)

  -- describe("stringify", function()
  --   it("should stringify simple array", function()
  --     local result = utils.stringify({ 1, 2, "test" })
  --     assert.are.same(result, "1,2,test")
  --   end)
  -- end)

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
end)
