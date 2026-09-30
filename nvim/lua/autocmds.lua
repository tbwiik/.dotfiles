require "nvchad.autocmds"

-- Reload unchanged buffers when files are modified outside Neovim, including by Copilot.
local autoread_group = vim.api.nvim_create_augroup("autoread_external_changes", { clear = true })

local function check_external_changes()
  if vim.fn.mode() ~= "c" then
    vim.cmd "silent! checktime"
  end
end

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = autoread_group,
  callback = check_external_changes,
})

vim.fn.timer_start(1000, function()
  vim.schedule(check_external_changes)
end, { ["repeat"] = -1 })
