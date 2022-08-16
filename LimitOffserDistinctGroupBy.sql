-- Table : mst_customer

-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 001         Tika Yesi      081232233233  t              1995-01-01
-- 002         Jution Kirana  081232233234  t              1995-01-02
-- 003         Doni Octamalnan    0812322332444   f             2022-02-02
-- 004         Pikri Rupta    08123222222   t              2022-02-02
-- 005         Asahela        08123222211   t              2022-03-02
-- 006         Pujiba         08123222211   f              2022-03-02
-- 007         Alababa        08123622211   f              1998-03-02

-- Dari data diatas, buatlah query untuk menampilkan 3 data dari table mst_customer yang join datenya terbaru sehingga output dari data tersebut adalah

-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 005         Asahela        08123222211   0              2022-03-02
-- 006         Pujiba         08123222211   1              2022-03-02
-- 004         Pikri Rupta    08123222222   0              2022-02-02

SELECT * FROM mst_customer WHERE join_date BETWEEN '2022-02-02' AND '2022-03-02' ORDER BY join_date DESC LIMIT 3;


-- Pada materi sebelumnya kamu telah diajarkan tentang konsep pagination, berdasarkan data diatas. Tuliskan query untuk mendapatkan data pada page 1 dengan size sebanyak 3 data. Sehingga output dari hasil query tersebut adalah sebagai berikut:

-- id          customer_name  phone_number  active_member  join_date
-- ----------  -------------  ------------  -------------  ----------
-- 004         Pikri Rupta    08123222222   0              2022-02-02
-- 005         Asahela        08123222211   0              2022-03-02
-- 006         Pujiba         08123222211   1              2022-03-02

SELECT * FROM mst_customer WHERE join_date BETWEEN '2020-02-02' AND '2022-03-02';


-- Dari data diatas, diketahui bahwa terdapat data yang sama pada join date yaitu customer dengan id 005 dan 006. Tuliskan query yang dapat digunakan agar join date hanya menampilkan data yang unique sehingga hasil dari query tersebut adalah sebagai berikut:

-- join_date
-- ----------
-- 1995-01-01
-- 1995-01-02
-- 1997-02-02
-- 2022-02-02
-- 2022-03-02
-- 1998-03-02

select join_date from mst_customer where id = '001' or id = '002' or id = '003' or id = '004' or id = '006' or id = '007';

-- Dari data diatas, cobalah mengelompokkan data active member dari table mst_customer sehingga hasil dari query tersebut adalah

-- active_member
-- -------------
-- 0
-- 1

select active_member from mst_customer group by active_member;