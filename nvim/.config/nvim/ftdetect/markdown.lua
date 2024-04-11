-- # markdown filetype file
-- au BufRead,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown
-- au BufRead,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype markdown
-- vim.filetype.add({
--   extension = {
--     mdx = "markdown",
--   },
-- })

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.treesitter.language.register("markdown", "mdx")
