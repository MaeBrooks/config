return function(folder, list, initial)
  local acc = initial

  for _, value in ipairs(list) do
    acc = folder(acc, value)
  end

  return acc
end
