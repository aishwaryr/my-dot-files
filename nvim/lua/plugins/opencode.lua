return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    config = function()
      vim.o.autoread = true

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle OpenCode" })

      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask OpenCode (review)" })

      vim.keymap.set("n", "go", function()
        return require("opencode").operator("@this ")
      end, { expr = true, desc = "Send motion to OpenCode" })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { expr = true, desc = "Send line to OpenCode" })
    end,
  },
}
