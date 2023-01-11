local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local cmp_npm = require('user.plugins.cmp-npm');
cmp_npm.setup()

cmp.setup.filetype('json', {
  sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'path' },
    { name = 'npm' },
  })
})
