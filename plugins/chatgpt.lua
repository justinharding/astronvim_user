local home = vim.fn.expand("$HOME")

return {
  "jackMort/ChatGPT.nvim",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "gpg --decrypt " .. home .. "/.justin_harding_midurth_secret.txt.gpg"
    })
  end,
}
