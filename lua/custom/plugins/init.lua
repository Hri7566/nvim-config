-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local colors = require 'custom.themes.red'

return {
  {
    {
      colors.plugin,
      tag = 'v0.11.0',
      lazy = false,
      priority = 1000,
      config = function()
        require('ashen').setup {}
        vim.cmd('colorscheme ' .. colors.colorscheme)

        -- Apply highlights
        for name, hl in pairs(colors.highlights) do
          if type(hl) == 'table' then
            hl.bg = hl.bg or 'None'
            vim.api.nvim_set_hl(0, name, hl)
          end
        end

        -- Apply extra highlights
        for name, hl in pairs(colors.extra_highlights) do
          vim.api.nvim_set_hl(0, name, hl)
        end
      end,
    },
  },
}
