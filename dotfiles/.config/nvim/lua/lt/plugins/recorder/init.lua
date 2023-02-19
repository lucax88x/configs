return {
  "chrisgrieser/nvim-recorder",
  event = "VeryLazy",
  config = function()
    require("recorder").setup()
  end,
}
