local vim = vim
local M = {}

local present, ufo = pcall(require, "ufo")

M.setupWithFallback = function()
  if not present then
    print("ufo not installed")
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
end

return M
