function DiagnosticsStatus()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

	local status = {}
	if errors > 0 then
		table.insert(status, "E:" .. errors)
	end
	if warnings > 0 then
		table.insert(status, "W:" .. warnings)
	end
	if info > 0 then
		table.insert(status, "I:" .. info)
	end
	if hints > 0 then
		table.insert(status, "H:" .. hints)
	end

	return table.concat(status, " ")
end

vim.o.statusline = "%C %f %m %r %= " .. "%{v:lua.DiagnosticsStatus()}" .. " %y %C"

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
	callback = function()
		-- Only redraw if we're in the current buffer
		if vim.api.nvim_get_current_buf() then
			vim.cmd("redrawstatus")
		end
	end,
})
