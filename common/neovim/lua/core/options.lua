-- Search
vim.o.ignorecase = true -- ignore casing for patterns
vim.o.smartcase = true -- re-enable case for patterns when caps are present
vim.o.hlsearch = true -- continually highlight all search results

-- UI
vim.o.ruler = true -- show cursor position
vim.o.number = true -- precede lines with their number
vim.o.relativenumber = true -- use relative line numbers instead
vim.wo.signcolumn = "yes"
vim.o.wrap = true
vim.o.linebreak = true -- only wrap at sensible characters
vim.o.breakindent = true -- indent wrapped lines
vim.o.scrolloff = 2 -- keep at least this many lines around cursor
vim.o.list = true -- display unprintable characters
vim.o.listchars = [[tab:→ ,space:·,nbsp:␣,trail:•,eol:↵,precedes:«,extends:»]]
vim.o.tabstop = 4 -- render tabs as four spaces
vim.o.laststatus = 3 -- global statusline

-- General enhancements
vim.o.updatetime = 250 -- faster update interval
vim.o.autoread = true -- auto update outside changes
vim.o.hidden = true -- don't save when switching buffers
