json.array!(@barangs) do |barang|
  json.extract! barang, :id, :code, :name, :description, :harga

  if barang.unit
    json.unit barang.unit.name
  else
    json.unit nil
  end

  if barang.category
    json.category barang.category.name
  else
    json.category nil
  end
end