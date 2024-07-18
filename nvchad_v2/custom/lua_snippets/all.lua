local function random_string(length)
  local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  local result = {}
  local len = #chars
  for _ = 1, length do
    local rand = math.random(len)
    table.insert(result, chars:sub(rand, rand))
  end
  return table.concat(result)
end

return {
  s("r8", f(function() return random_string(8) end)),
  s("r16", f(function() return random_string(16) end)),
}
