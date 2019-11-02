function ValidateName(str)
	str = string.gsub(str, "[%p%c]", "")
	str = string.sub(str, 1, 26)
	return str
end

function IsValidName(str)
	if string.match(str, "[%p%c]") or string.len(str) > 26 or string.len(str) < 6 then return false end
	return true
end