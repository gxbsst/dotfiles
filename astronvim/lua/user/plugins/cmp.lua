return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"

    -- support copilot
    -- opts.mapping["<C-e>"] = function(fallback)
    --   cmp.mapping.abort()
    --   local copilot_keys = vim.fn["copilot#Accept"]()
    --   if copilot_keys ~= "" then
    --     vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --   else
    --     fallback()
    --   end
    -- end

    -- opts.mapping["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     local copilot_keys = vim.fn["copilot#Accept"]()
    --     if copilot_keys ~= "" then
    --       vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --     else
    --       fallback()
    --     end
    --   end
    -- end

    opts.formatting = {
      fields = { "kind", "abbr", "menu" },

      format = function(entry, vim_item)
        local kind_icons = {
          Text = "",
          Method = "m",
          Function = "",
          Constructor = "",
          Field = "",
          Variable = "",
          Class = "",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        }
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    }

    return opts
  end,
}
