-- Tabel : mst_menu
-- id          menu_name      price  
-- ----------  -------------  ------------
-- M001        Iga Panggang   80000
-- M002        Sop Tulang Iga 60000
-- M003        Iga Penyet     56000
-- M004        Iga Panggang   120000
-- M005        Steak          120000

-- Dari data table mst_menu diatas, kita dapat melihat bahwa total menu yang dimiliki oleh enigma resto adalah sebanyak 5 menu. Namun ketika menu makanan semakin bertambah banyak, maka akan sulit bagi kita menghitungnya secara manual. Karena itu, tuliskan bagaimana cara melakukan query yang berguna untuk menentukan jumlah menu yang ada di enigma resto

-- Output dari query tersebut adalah
-- COUNT(id)
-- ----------
-- 5

select COUNT(id) from mst_menu;

-- Dari table diatas, tuliskan query untuk menentukan rata-rata harga menu makanan dari enigma resto dengan membulatkan 2 angka dibelakang koma pada nama table mst_menu dengan alias nama column “rata_rata_harga”, sehingga outputnya adalah sebagai berikut:

-- rata_rata_harga
-- ---------------
-- 87200.0

select rata_rata_harga from (select avg(price) as rata_rata_harga from mst_menu) as rata_rata_harga;

-- Dari table diatas, tuliskan query untuk menentukan harga tertinggi dari menu makanan yang ada pada enigma resto

-- Sehingga output dari query tersebut adalah
-- max(price)
-- ----------
-- 120000

select max(price) from mst_menu;

-- Dari table diatas, tuliskan query untuk menentukan harga terendah dari menu makanan yang ada pada enigma resto

-- Output dari query tersebut adalah
-- MIN(price)
-- ----------
-- 56000

select MIN(price) from mst_menu;

-- Dari table diatas, tuliskan query untuk menentukan total dari keseluruhan harga menu makanan yang ada pada enigma resto

-- Output dari query tersebut adalah
-- SUM(price)
-- ----------
-- 436000

select SUM(price) from mst_menu;