json.extract! @stock, :id, :jumlah
if @stock.barang
  json.barang_id @stock.barang.id
  json.code @stock.barang.code
  json.name @stock.barang.name
  json.harga @stock.barang.harga
  json.min_bayar_po @stock.barang.min_bayar_po
else
  json.barang nil
  json.code nil
  json.name nil
  json.harga nil
end
if @stock.barang.unit
    json.unit @stock.barang.unit.name
else
  json.unit nil
end
if @stock.barang.promo
    json.promo_id @stock.barang.promo.id
    json.disc @stock.barang.promo.disc
    json.threshold_qty @stock.barang.promo.threshold_qty
else
  json.promo_id nil
  json.disc nil
  json.threshold_qty nil
end