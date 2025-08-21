-- some languages (like typescript) have entire language plugins that can be useful:
--    https://github.com/pmizio/typescript-tools.nvim
local vue = require 'config.vue'
return {
  init_options = {
    plugins = {
      vue.plugin,
    },
  },
  filetypes = vue.filetypes,
  child = 'vue_ls',
}
