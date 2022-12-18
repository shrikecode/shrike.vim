-- Fix weird size if started with -e
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
        local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
        vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 40)
    end
})
