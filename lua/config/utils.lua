local format_commands = {
    terraform = function()
        local filepath = vim.api.nvim_buf_get_name(0)
        return { "terraform", "fmt", filepath }
    end,
}

-- Format current file
function FormatCurrentFile()
    local get_command = format_commands[vim.bo.filetype] or nil
    if not get_command then
        print "Formatting command not implemented yet for this filetype"
        return
    end

    print "Formatting..."
    local command = get_command()
    local result = vim.system(command, { text = true }):wait()

    if result.code == 0 then
        vim.cmd "edit"
        print "Formatting done!"
    else
        print("ERROR - something went wrong:\n" .. result.stderr)
    end
end
