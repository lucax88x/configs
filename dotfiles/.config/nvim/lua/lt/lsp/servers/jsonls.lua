return function()
  return {
    settings = {
      json = {
        trace = {server = 'messages'},
        schemas = require('schemastore').json.schemas()
      }
    }
  }
end
