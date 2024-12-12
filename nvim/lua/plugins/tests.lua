return {
  { "alfaix/neotest-gtest", "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-python", "neotest-gtest" } },
  },
}
