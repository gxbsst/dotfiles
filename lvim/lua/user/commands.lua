-- 给panel发送指令

-- Helper function to handle the arguments
local function handle_args(args)
    local merged_args = {}
    local temp_arg = nil

    for _, arg in ipairs(args) do
        if temp_arg then
            temp_arg = temp_arg .. ' ' .. arg
            if string.sub(arg, -1) == '"' then
                table.insert(merged_args, string.sub(temp_arg, 2, -2))
                temp_arg = nil
            end
        elseif string.sub(arg, 1, 1) == '"' then
            temp_arg = arg
        else
            table.insert(merged_args, arg)
        end
    end
    return merged_args
end

-- Function to send command to tmux
local function send_to_tmux(...)
    local args = {...}

    if #args == 0 then
        print("Usage: SendToTmux <panel_id> \"'wx build-npm'\"")
        return
    end

    local merged_args = handle_args(args)
    local merged_args_str = table.concat(merged_args, " ")
    local command = string.format("tmux send-keys -t %s c-m", merged_args_str)
    os.execute(command)
end

-- Autocommand creation
vim.api.nvim_exec([[
    augroup SendToTmux
    autocmd!
    autocmd User * command! -nargs=* SendToTmux lua send_to_tmux(<f-args>)
    augroup END
]], false)
