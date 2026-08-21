require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Debug keybindings
map("n", "<leader><Right>", function()
  require("dap").continue()
end, { desc = "Resume execution" })
map("n", "<leader><Up>", function()
  require("dap").step_over()
end, { desc = "Step over next line" })
map("n", "<leader><Down>", function()
  require("dap").step_into()
end, { desc = "Step into function" })
map("n", "<leader><Left>", function()
  require("dap").step_out()
end, { desc = "Step out of function" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
map("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "terminate debug session" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
