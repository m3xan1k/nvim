opts = {
  provider_selector = function(_, filetype, buftype)
    return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
      or { "treesitter", "indent" } -- if file opened, try to use treesitter if available
  end,
}

require('ufo').setup(opts)
