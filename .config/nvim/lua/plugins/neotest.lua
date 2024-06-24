return {
  "nvim-neotest/neotest",
  dependencies = { "haydenmeade/neotest-jest" },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "yarn test",
        jestConfigFile = function(file)
          if string.find(file, "/packages/") then
            return string.match(file, "(.-)/src") .. "/jest.config.js"
          end
          return vim.fn.getcwd() .. "/jest.config.js"
        end,
        env = { CI = true },
        cwd = function(file)
          if string.find(file, "/packages/") then
            return string.match(file, "(.-)/src")
          end
          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
