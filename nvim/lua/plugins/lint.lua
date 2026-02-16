return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			go = { "golangci-lint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			githubaction = { "actionlint" },
			nix = { "statix" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				local linters = lint.linters_by_ft[vim.bo.filetype]
				if not linters then
					return
				end

				local valid_linters = {}

				for _, linter_name in ipairs(linters) do
					local linter_def = lint.linters[linter_name]

					if linter_def then
						local cmd = linter_def.cmd or linter_name
						if vim.fn.executable(cmd) == 1 then
							table.insert(valid_linters, linter_name)
						end
					end
				end

				if #valid_linters > 0 then
					lint.try_lint(valid_linters)
				end
			end,
		})
	end,
}
