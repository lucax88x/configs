local present = pcall(require, "hydra")

if not present then
  return
end

require('lt.plugins.hydra.git')
require('lt.plugins.hydra.windows')
