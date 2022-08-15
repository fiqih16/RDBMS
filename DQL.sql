-- Dari data diatas, tuliskan perintah yang dapat digunakan untuk menampilkan data nama menu dari table mst_menu

select menu_name from mst_menu;

-- Dari data diatas, tuliskan perintah yang dapat digunakan untuk menampilkan data nama menu dan price dari table mst_menu

select menu_name, price from mst_menu;

-- Enigma Resto memberikan pajak sebesar 200 dari setiap menu makanan yang disediakan. Dari data table sebelumnya, tuliskan bagaimana perintah yang dapat anda gunakan untuk menampilkan nama menu dan hasil penjumlahan harga makanan di Enigma Resto dengan pajak yang telah ditetapkan dengan nama alias price_after_tax. Sehingga harga Sop Tulang Iga menjadi 60200, Iga Bakar 70200, dan seterusnya untuk setiap menu.

-- Output dari query tersebut adalah:
-- menu_name     price_after_tax
-- ------------  ---------------
-- Iga Panggang  80200
-- Sop Tulang I  60200
-- Iga Penyet    56200
-- Iga Panggang  120200
-- Steak         120200

select menu_name, price + 200 as price_after_tax from mst_menu;

-- Dari data menu makanan yang dimiliki Enigma Resto, tuliskan perintah yang dapat digunakan untuk menampilkan semua data berdasarkan harga makanan yang termurah sampai yang termahal

-- Output dari query tersebut:
-- id          menu_name   price
-- ----------  ----------  ----------
-- M003        Iga Penyet  56000
-- M002        Sop Tulang  60000
-- M001        Iga Pangga  80000
-- M004        Iga Pangga  120000
-- M005        Steak       120000

select * from mst_menu order by price;

-- Dari data menu makanan yang dimiliki Enigma Resto, tuliskan perintah yang dapat digunakan untuk menampilkan semua data berdasarkan nama makanan dari A-Z dan harga makanan yang termahal sampai yang termurah

-- Output dari query tersebut adalah:
-- id          menu_name     price
-- ----------  ------------  ----------
-- M004        Iga Panggang  120000
-- M001        Iga Panggang  80000
-- M003        Iga Penyet    56000
-- M002        Sop Tulang I  60000
-- M005        Steak         120000

select * from mst_menu order by menu_name, price desc;