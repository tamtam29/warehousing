User.create([
  {first_name: "Adi", last_name: "Tiatama", username: "adi_tiatama", email: "aditiatama@gmail.com", role: "Admin", password: "12345678", password_confirmation: "12345678"}
])
# Category.create([
#   { code: 'CAT0001', name: 'Pakaian' },
#   { code: 'CAT0002', name: 'Mainan anak-anak' },
#   { code: 'CAT0003', name: 'Elektronik' },
#   { code: 'CAT0004', name: 'Lain-lain' }
# ])
# Barang.create([
#   { category_id: 1, unit_id: 4, code: 'BAR0001', name: 'Baju Satu Stel', harga: 100000 },
#   { category_id: 2, unit_id: 2, code: 'BAR0002', name: 'Mobil-mobilan', harga: 25000 },
#   { category_id: 2, unit_id: 2, code: 'BAR0003', name: 'Pesawat-pesawatan', harga: 50000 },
#   { category_id: 3, unit_id: 2, code: 'BAR0004', name: 'Rice Cooker', harga: 350000 }
# ])
Unit.create([
  { name: "Buah"},
  { name: "Pcs"},
  { name: "Biji"},
  { name: "Stel"}
])
# BarangMasuk.create([
#   { barang_id: 1, no_transaksi: "BM2015180001", jumlah: 50, tgl_masuk: "2015-08-18"},
#   { barang_id: 2, no_transaksi: "BM2015180002", jumlah: 45, tgl_masuk: "2015-08-18"},
#   { barang_id: 3, no_transaksi: "BM2015180003", jumlah: 19, tgl_masuk: "2015-08-18"},
#   { barang_id: 4, no_transaksi: "BM2015180004", jumlah: 27, tgl_masuk: "2015-08-18"}
# ])
# Stock.create([
#   { barang_id: 1, jumlah: 50 },
#   { barang_id: 2, jumlah: 45 },
#   { barang_id: 3, jumlah: 19 },
#   { barang_id: 4, jumlah: 27 }
# ])
# Promo.create([
#   { barang_id: 1, name: "Promo Spesial Ramadhan", threshold_qty: 5, disc: 20},
#   { barang_id: 3, name: "Promo Tahun Baru", threshold_qty: 7, disc: 15}
# ])

require "#{File.dirname(__FILE__)}/../lib/import_data_rumah_asi.rb"

include ImportDataRumahAsi

import_category
import_barang