local options = {
    autoread = true,
    backup = false,             -- creates backup file
    breakindent = true,         -- Wrap indent to match  line start
    clipboard = 'unnamedplus',  -- allow access to system clipboard
    cursorline = true,          -- highlight current line
    cmdheight = 1,              -- give me one more line on the screen(not good idea)
    expandtab = true,           -- convert tab to spaces
    hlsearch = true,            -- highlight search
    incsearch = true,           -- append to search
    ignorecase = true,          -- ignore case in search patterns
    number = true,              -- show line numbers
    numberwidth = 4,            -- gutter width
    preserveindent = true,      -- Preserve indent structure as much as possible
    relativenumber = true,      -- show relative line numbers
    scrolloff = 2,              -- lines rest to start scroll
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
    timeoutlen = 500,           -- wait for keysequence
    writebackup = false,        -- don't create backup copy
    colorcolumn = '80',
    guifont = 'Ricty Diminished:h20:#e-subpixelantialias:#h-none',
    fileencoding = "utf-8",     -- File content encoding for the buffer
    foldenable = true,          -- enable fold for nvim-ufo
    foldlevel = 99,             -- set high foldlevel for nvim-ufo
    foldlevelstart = 99,        -- start with all code unfolded
    foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
    fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

vim.cmd("let g:vimwiki_list = [{'path': '~/Yandex.Disk/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]")
