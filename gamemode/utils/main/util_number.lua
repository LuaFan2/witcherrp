rp = rp or {}

function rp.formatMoney(n)
	return  string.Comma(n).. " " .. rp.Config.Currency
end

function rp.formatNumber(n)
	return string.Comma(n)
end