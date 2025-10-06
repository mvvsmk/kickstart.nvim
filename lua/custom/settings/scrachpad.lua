-- In ~/.config/nvim/lua/custom/settings/scratchpad.lua

local scratch_file = vim.fn.expand '~/.scratchpad'
local scratch_register = 's' -- We will use the "s" register

-- This function reads the scratchpad file and loads it into the register
local function sync_scratch_register()
  -- Open the file for reading
  local file = io.open(scratch_file, 'r')
  if not file then
    return -- Do nothing if the file doesn't exist
  end

  -- Read the entire file content
  local content = file:read '*a'
  file:close()

  -- Only update the register if the content is not empty
  if content and not (content == '') then
    -- vim.fn.setreg() sets the register value and type ('c' for character-wise)
    vim.fn.setreg(scratch_register, content, 'c')

    -- Optional: Notify that the register has been updated
    -- vim.notify('Scratch register "' .. scratch_register .. ' updated.', vim.log.levels.INFO)
  end
end

-- Create an autocmd group to ensure we don't duplicate the command
local scratchpad_group = vim.api.nvim_create_augroup('CustomScratchpad', { clear = true })

-- Run the sync function on CursorHold event
-- CursorHold fires after `updatetime` milliseconds of inactivity (default 4000ms)
vim.api.nvim_create_autocmd('CursorHold', {
  group = scratchpad_group,
  pattern = '*',
  callback = sync_scratch_register,
  desc = 'Sync content from scratchpad file to register "' .. scratch_register .. '"',
})

-- You can make the sync happen faster by reducing `updatetime`
-- The value is in milliseconds. Let's set it to 500ms (half a second).
vim.opt.updatetime = 500

print 'Scratchpad sync enabled. Pasted text will appear in register "s".'
