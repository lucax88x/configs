return function(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true;

  return {settings = {json = {schemas = require('schemastore').json.schemas()}}}
end
