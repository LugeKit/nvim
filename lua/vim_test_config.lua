vim.api.nvim_create_user_command("GoTestSuite", "TestSuite -gcflags=all=-l <args>", { nargs = "*" })

vim.api.nvim_create_user_command("GoTestFile", "TestFile -gcflags=all=-l <args>", { nargs = "*" })

vim.api.nvim_create_user_command("GoTestNearest", "TestNearest -gcflags=all=-l <args>", { nargs = "*" })
