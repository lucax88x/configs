local M = {}
local inspect = require("inspect")

function M.stringify(t)
	return inspect(t)
end

function M.length(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

function M.is_empty(s)
	if s == nil then
		return true
	end

	if M.is_array(s) then
		return M.length(s) == 0
	end

	return s == ""
end

function M.is_table(to_check)
	return type(to_check) == "table"
end

function M.is_array(to_check)
	if to_check == nil then
		return false
	end

	if not M.is_table(to_check) then
		return false
	end

	local i = 0
	for _ in pairs(to_check) do
		i = i + 1
		if to_check[i] == nil then
			return false
		end
	end
	return true
end

function M.find_index(t, val)
	for index, value in ipairs(t) do
		if value == val then
			return index
		end
	end

	return -1
end

function M.has_key(t, key)
	for t_key, _ in pairs(t) do
		if t_key == key then
			return true
		end
	end

	return false
end

function M.has_value(t, val)
	for _, value in ipairs(t) do
		if value == val then
			return true
		end
	end

	return false
end

function M.keys(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end

function M.remove_by_key(t, key)
	local element = t[key]
	t[key] = nil
	return element
end

function M.aggregate_callbacks(callback_total, callback)
	local callback_counter = 0

	local errors = {}
	local results = {}
	local function verify_callbacks(error, result)
		if callback ~= nil then
			callback_counter = callback_counter + 1

			if not M.is_empty(error) then
				if error ~= nil then
					table.insert(errors, error)
				end
			else
				if result ~= nil then
					table.insert(results, result)
				end
			end

			if callback_counter == callback_total then
				callback(errors, results)
			end
		else
			print("has no callback")
		end
	end

	if callback_total == 0 then
		callback(nil, nil)
	end

	return verify_callbacks
end

function M.filter(list, test)
	local result = {}

	for index, value in ipairs(list) do
		if test(value, index) then
			result[#result + 1] = value
		end
	end

	return result
end

function M.first(list, test)
	for index, value in ipairs(list) do
		if test ~= nil then
			if test(value, index) then
				return value
			end
		else
			return value
		end
	end
	return nil
end

function M.any(list, test)
	return M.first(list, test) ~= nil
end

function M.clone(t)
	local cloned = {}
	for key, value in pairs(t) do
		cloned[key] = value
	end
	return cloned
end

function M.sequential(parameters, next, callback)
	if parameters == nil then
		print("has empty queue, returning")
		callback(nil, nil)
		return
	end

	local queue = M.clone(parameters)

	if M.length(queue) == 0 then
		print("has empty queue, returning")
		callback(nil, nil)
		return
	end

	local verify_callbacks = M.aggregate_callbacks(M.length(queue) + 1, callback)

	local function loop(errors, results)
		if M.length(queue) > 0 then
			local parameter = nil
			if M.is_array(queue) then
				parameter = table.remove(queue, 1)
			else
				local keys = M.keys(queue)
				local first_key = M.first(keys)
				parameter = { key = first_key, value = M.remove_by_key(queue, first_key) }
			end

			print("next with parameter " .. M.stringify(parameter))

			verify_callbacks(errors, results)
			next(parameter, loop)
		else
			verify_callbacks(errors, results)
		end
	end

	loop()
end

function M.concat(dest, src)
	for _, value in ipairs(src) do
		table.insert(dest, value)
	end

	return dest
end

-- Function to check if the given string starts with any string from the array (case-insensitive)
function M.starts_with_any(accepted_strings, to_match_string)
	for _, accepted_string in ipairs(accepted_strings) do
		if string.lower(string.sub(to_match_string, 1, #accepted_string)) == string.lower(accepted_string) then
			return true
		end
		if string.lower(string.sub(accepted_string, 1, #to_match_string)) == string.lower(to_match_string) then
			return true
		end
	end
	return false
end

return M
