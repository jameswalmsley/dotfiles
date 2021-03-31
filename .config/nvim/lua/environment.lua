nvcode_base = vim.fn.stdpath('config')
nvcode_global = false
if os.getenv('NVCODE_BASE') then
	nvcode_global = true
	nvcode_base = os.getenv('NVCODE_BASE') .. '/nvim'
end

