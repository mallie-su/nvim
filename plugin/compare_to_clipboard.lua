local function diff_buffers(buf1, buf2)
    -- 1. Validate that both buffers exist
    if not vim.api.nvim_buf_is_valid(buf1) or not vim.api.nvim_buf_is_valid(buf2) then
        vim.notify("One or both buffers are invalid", vim.log.levels.ERROR)
        return
    end

    -- 2. Get the current window and set it to the first buffer
    local win1 = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win1, buf1)

    -- 3. Create a vertical split and get the new window handle
    vim.cmd("vsplit")
    local win2 = vim.api.nvim_get_current_win()

    -- 4. Set the second buffer in the new window
    vim.api.nvim_win_set_buf(win2, buf2)

    -- 5. Turn on diff mode in both windows
    vim.api.nvim_win_call(win1, function()
        vim.cmd("diffthis")
    end)

    vim.api.nvim_win_call(win2, function()
        vim.cmd("diffthis")
    end)
end

vim.api.nvim_create_user_command('Compare2Clipboard', 
    function(opts)
        print('Inside Compare user command')
        local currentFileScratchBuffer = vim.api.nvim_create_buf(false, true)
        local clipboardScratchBuffer = vim.api.nvim_create_buf(false, true)

        local currentBufferContent = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
        vim.api.nvim_buf_set_lines(currentFileScratchBuffer, 0, -1, true, currentBufferContent)

        local clipboard_content = vim.fn.getreg("+")
        -- Fallback to selection clipboard if system is empty
        if clipboard_content == "" then
            clipboard_content = vim.fn.getreg("*")
        end
        local lines = vim.split(clipboard_content, "\n", { plain = true })
        vim.api.nvim_buf_set_lines(clipboardScratchBuffer, 0, -1, true, lines)

        diff_buffers(currentFileScratchBuffer, clipboardScratchBuffer)
    end,
    {nargs = 0}
)

