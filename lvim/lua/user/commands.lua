-- 给panel发送指令

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "" },
  callback = function()
    -- tmux send-keys -t 4 'wx build-npm' c-m 
    local function send_to_tmux(target_pane, text)
      -- 将文本转义为适合tmux使用的格式
      local escaped_text = text:gsub("'", "'\\''")
      -- 构造tmux发送命令
      local cmd = string.format("tmux send-keys -t %s '%s' Enter", target_pane, text)
      -- 执行命令
       os.execute(cmd)
    end

    vim.cmd("command! -nargs=+ SendToTmux lua send_to_tmux(<f-args>)")
  end,
})
