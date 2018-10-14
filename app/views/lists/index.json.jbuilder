json.array!(@lists) do |list|
  json.partial! 'lists/list', list: list
end
