require('scrollbar').setup({
    handle = {
        color = '#3f3f3f',
    },
    marks = {
        Cursor = { priority = 0 },
        Search = { color = '#030303', priority = 1 },
        GitAdd = { color = '#9ece6a', priority = 2 },
        GitChange = { color = '#89ddff', priority = 3 },
        GitDelete = { color = '#f7768e', priority = 4 },
        Error = { color = '#ff0000', priority = 5 },
        Warn = { priority = 6 },
        Info = { priority = 7 },
        Hint = { priority = 8 },
        Misc = { priority = 9 },
    }
})
