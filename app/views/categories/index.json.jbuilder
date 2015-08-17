json.array!(@categories) do |category|
  json.extract! category, :id, :code, :name
end