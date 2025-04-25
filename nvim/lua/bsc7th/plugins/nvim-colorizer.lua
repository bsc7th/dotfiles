return {
  "norcalli/nvim-colorizer.lua",
  opts = {
    filetypes = { "css", "javascript", "html", "lua", "json", "yaml", "scss" },

    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    css = true,
    css_fn = true,

    mode = "background",
  },
  config = function()
    require("colorizer").setup()
  end,
}
