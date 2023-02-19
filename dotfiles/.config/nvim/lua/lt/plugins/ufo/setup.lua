local M = {}

local present, ufo = pcall(require, "ufo")

M.setupWithFallback = function()
  if not present then
    vim.notify("ufo not installed")

    -- fold
    vim.wo.foldcolumn = "0" -- defines 1 col at window left, to indicate folding
    vim.o.foldlevelstart = 99 -- start file with all folds opened

    -- using treesitter for folding
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

    return
  end

  local ftMap = {
    vim = "indent",
    git = "",
  }

  local function customizeSelector(bufnr)
    local function handleFallbackException(err, providerName)
      if type(err) == "string" and err:match("UfoFallbackException") then
        return ufo.getFolds(bufnr, providerName)
      else
        return require("promise").reject(err)
      end
    end

    return ufo.getFolds(bufnr, "lsp")
        :catch(function(err)
          return handleFallbackException(err, "treesitter")
        end)
        :catch(function(err)
          return handleFallbackException(err, "indent")
        end)
  end

  ufo.setup({
    provider_selector = function(_, filetype, _)
      return ftMap[filetype] or customizeSelector
    end,
  })

  vim.keymap.set("n", "zR", ufo.openAllFolds)
  vim.keymap.set("n", "zM", ufo.closeAllFolds)

  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  -- done by statuscolumn plugin
  --[[ vim.o.statuscolumn = "%=%l%s%C" ]]
end

return M
