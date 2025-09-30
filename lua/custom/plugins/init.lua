-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.env.NODE_EXTRA_CA_CERTS = '/home/amd/Downloads/certificates/AMD_CA.crt'
vim.o.relativenumber = true
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>')
return {}
