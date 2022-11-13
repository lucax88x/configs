local present, aerial = pcall(require, "aerial")

if not present then
  return
end

aerial.setup({
  on_attach = function(bufnr)
    local r = require("lt.utils.remaps")

    r.noremap("n", "{o", "<cmd>AerialPrev<CR>", "Aerial previous item", { buffer = bufnr })
    r.noremap("n", "}o", "<cmd>AerialNext<CR>", "Aerial next item", { buffer = bufnr })
    r.noremap("n", "[[o", "<cmd>AerialPrevUp<CR>", "Aerial previos item up", { buffer = bufnr })
    r.noremap("n", "]]o", "<cmd>AerialNextUp<CR>", "Aerial next item up", { buffer = bufnr })
  end,
})
