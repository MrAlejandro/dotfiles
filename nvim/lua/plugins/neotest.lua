return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "zidhuss/neotest-minitest",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-minitest")({
          test_cmd = function()
            local result = vim.fn.systemlist("docker ps -q -f name=api | head -n 1")
            local container_id = result[1]

            return vim.tbl_flatten({
              "docker",
              "exec",
              container_id,
              "rails",
              "t",
            })
          end,

          transform_spec_path = function(path)
            local prefix = require("neotest-minitest").root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,

          results_path = "/tmp/minitest.output",
        }),
      },
    })
  end,
}
