-- Dari data diatas, buatlah perintah untuk menampilkan data pada table mst_menu dimana menu makanan nya adalah Iga Panggang

-- Output dari query tersebut adalah

-- id          menu_name     price
-- ----------  ------------  ----------
-- M001        Iga Panggang  80000
-- M004        Iga Panggang  120000

select * from mst_menu where menu_name = 'Iga Panggang';

-- Dari data diatas, buatlah perintah untuk menampilkan data pada table mst_menu dimana harganya kurang dari seratus ribu

-- Output dari query tersebut adalah :
-- id          menu_name     price
-- ----------  ------------  ----------
-- M001        Iga Panggang  80000
-- M002        Sop Tulang I  60000
-- M003        Iga Penyet    56000

select * from mst_menu where price < 100000;



-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 001         Tika Yesi      081232233233  t              1995-01-01
-- 002         Jution Kirana  081232233234  t              1995-01-02
-- 004         Pikri Rupta    08123222222   t              2022-02-02
-- 005         Asahela        08123222211   t              2022-03-02
-- 006         Pujiba         08123222211   f              2022-03-02

-- Dari data mst_customer diatas buatlah query untuk mendapatkan member yang status active_member nya true atau join_date nya lebih dari tanggal ‘2000-01-01’ sehingga output yang ditampilkan adalah
-- Keterangan:
-- Query true pada code runner ini digantikan dengan angka 0, false digantikan dengan angka 1
-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 001         Tika Yesi      081232233233  0              1995-01-01
-- 002         Jution Kirana  081232233234  0              1995-01-02
-- 004         Pikri Rupta    08123222222   0              2022-02-02
-- 005         Asahela        08123222211   0              2022-03-02
-- 006         Pujiba         08123222211   1              2022-03-02

select * from mst_customer where active_member = 0 or 1 and join_date > '2000-01-01';


-- Dari data diatas, buatlah query untuk menampilkan data customer yang join date nya berada diantara tanggal 1996-1-1 sampai 2000-1-1

-- Sehingga outputnya adalah sebagai berikut:
-- id          customer_name    phone_number    active_member  join_date
-- ----------  ---------------  --------------  -------------  ----------
-- 003         Doni Octamalnan  08123223323444  1              1997-02-02
-- 007         Alababa          08123622211     1              1998-03-02

select * from mst_customer where join_date between '1996-01-01' and '2000-01-01';

-- Dari data mst_customer yang ada, tampilkan customer yang memiliki nama berawalan dengan huruf P
-- Sehingga outputnya adalah sebagai berikut:

-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 004         Pikri Rupta    08123222222   0              2022-02-02
-- 006         Pujiba         08123222211   1              2022-03-02

select * from mst_customer where customer_name like 'P%';

-- Dari data mst_customer yang ada, tampilkan semua data customer yang join date nya ada pada tanggal ‘1995-01-01' dan '2022-02-02'. Sehingga output dari perintah tersebut adalah sebagai berikut:
-- Dan mengubah active_member menjadi 0 atau 1
-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 001         Tika Yesi      081232233233  0              1995-01-01
-- 004         Pikri Rupta    08123222222   0              2022-02-02

select * from mst_customer where join_date = '1995-01-01' or join_date = '2022-02-02';
