local M = {}

local function concatenate_array(array)
  return table.concat(array, ",")
end

local function concatenate_table(t)
  if not M.is_table(t) then
    return ""
  end

  local str = ""
  for key, value in pairs(t) do
    str = str .. "key: " .. key
    str = str .. "\r\n"
    str = str .. "value: "

    if M.is_array(value) then
      str = str .. concatenate_array(value)
    else
      if M.is_table(value) then
        str = str .. concatenate_table(value)
      else
        str = str .. tostring(value)
      end
    end
    str = str .. "\r\n"
  end
  return str
end

function M.length(t)
  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

function M.is_empty(s)
  return s == nil or s == ""
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

function M.print_table(t)
  print(concatenate_table(t))
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

  local function verify_callbacks()
    if callback ~= nil then
      callback_counter = callback_counter + 1

      --[[ print("callback count " .. callback_counter .. "/" .. callback_total) ]]

      if callback_counter == callback_total then
        callback()
      end
    end
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
  local queue = M.clone(parameters)

  if M.length(queue) == 0 then
    callback()
  end

  local verify_callbacks = M.aggregate_callbacks(M.length(queue), callback)

  local function loop()
    local function verify_and_loop()
      verify_callbacks()
      loop()
    end

    if M.length(queue) > 0 then
      local parameter = nil
      if M.is_array(queue) then
        parameter = table.remove(queue, 1)
      else
        local keys = M.keys(queue)
        local first_key = M.first(keys)
        parameter = { key = first_key, value = M.remove_by_key(queue, first_key) }
      end

      next(parameter, verify_and_loop)
    else
      verify_callbacks()
    end
  end

  loop()
end

return M
