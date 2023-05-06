local options = {
    autoread = true,
    backup = false,             -- creates backup file
    clipboard = 'unnamedplus',  -- allow access to system clipboard
    cursorline = true,          -- highlight current line 
    cmdheight = 1,              -- some more space for messages
    expandtab = true,           -- convert tab to spaces
    hlsearch = true,            -- highlight search
    incsearch = true,           -- append to search
    ignorecase = true,          -- ignore case in search patterns
    number = true,              -- show line numbers
    numberwidth = 4,            -- gutter width
    relativenumber = true,     -- show relative line numbers
    scrolloff = 6,              -- lines rest to start scroll
    showtabline = 2,            -- always show tabs
    shiftwidth = 4,             -- number of spaces for each indentation
    showmode = false,           -- don't show thing like --INSERT in command line
    signcolumn = 'yes',         -- otherwise it will move text
    smartindent = true,         -- "smart" indentation
    softtabstop = 4,            -- backspace will delete right number of spaces
    splitbelow = true,          -- horizontal split always below current buffer
    splitright = true,          -- vertical split on the right from current buffer
    swapfile = false,           -- creates swap file
    tabstop = 4,                -- 2 spaces for tab
    termguicolors = true,       -- same colors in terminal and in gui
    undofile = true,            -- undo persistent history
    updatetime = 50,            -- faster completion 
    timeoutlen = 500,          -- wait for keysequence
    writebackup = false,        -- don't create backup copy
    --colorcolumn = '80'
    guifont = 'Roboto Mono:h16:#e-subpixelantialias:#h-none',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- make default background light
vim.cmd [[set background=light]]

-- set bruin colorscheme
local colorscheme = 'simple'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

-- misc
vim.g.mapleader = ' '
vim.cmd('set whichwrap+=<,>,h,l')
vim.cmd([[set iskeyword+=-]])
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
