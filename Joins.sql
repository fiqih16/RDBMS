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

-- Table : mst_table
-- id             table_number      status
-- -------------  ------------      ------------
-- T001           01                t
-- T002           02                t
-- T003           03                t
-- T004           04                t
-- T005           05                f

-- Table : mst_menu
-- id          menu_name      price  
-- ----------  -------------  ------------
-- M001        Iga Panggang   80000
-- M002        Sop Tulang Iga 60000
-- M003        Iga Penyet     56000
-- M004        Iga Panggang   120000
-- M005        Steak          120000

-- Table : trx_bill
-- id          transaction_date    paid_status     table_id      customer_id
-- ----------  -------------       ------------    ------------  ------------
-- TR001        2022-06-02          t              T001          001
-- TR002        2022-06-04          t              T001          002
-- TR003        2022-06-05          t              T002          003

-- Table : trx_bill_detail
-- id           bill_id         menu_id         quantity 
-- ----------  -------------    ------------    ------------  
-- TD01        TR001            M001            1
-- TD02        TR001            M002            1
-- TD03        TR001            M003            2
-- TD04        TR002            M005            2
-- TD05        TR003            M001            1
-- TD06        TR003            M003            1


-- Perhatikan data table dari design ERD yang telah dituliskan diatas.

-- Relasi dan data diatas menjelaskan tentang data transaksi enigma resto.

-- Dari data diatas, buatlah query yang berguna untuk menampilkan nama semua customer yang telah melakukan transaksi beserta tanggal transaksinya. Sehingga output dari perintah tersebut adalah

-- Hasil output dari soal ini adalah
-- customer_name  transaction_date
-- -------------  ----------------
-- Tika Yesi      2022-06-02
-- Jution Kirana  2022-06-04
-- Doni Octamaln  2022-06-04

select c.customer_name, t.transaction_date from mst_customer c, trx_bill t where c.id = t.customer_id;

-- Dari relasi dan data diatas, buatlah query yang berguna untuk menampilkan nama customer dan total pembelian dengan total harga pembelian tertinggi. Sehingga output dari query tersebut adalah

-- Hasil output dari soal ini adalah:
-- customer_name  price
-- -------------  ----------
-- Tika Yesi      196000

select customer_name, sum(price) as price from trx_bill_detail join trx_bill on trx_bill.id = trx_bill_detail.bill_id join mst_menu on mst_menu.id = trx_bill_detail.menu_id join mst_customer on mst_customer.id = trx_bill.customer_id group by customer_name order by price desc limit 1;

-- Dari data tersebut, tuliskan query untuk menentukan menu mana yang sama sekali belum pernah terjual. Sehingga hasil dari query tersebut adalah

-- Hasil output dari soal ini adalah
-- menu_name
-- ------------
-- Iga Panggang

select menu_name from mst_menu where id not in (select menu_id from trx_bill_detail);

-- Dari data diatas, tuliskan query untuk menampilkan data menu dan total harga dari setiap menu yang menghasilkan total penjualan dengan harga tertinggi sampai menu yang menghasilkan total penjualan dengan harga terendah.
-- Sehingga output dari query tersebut adalah

-- Hasil dari output soal ini adalah
-- menu_name        total_harga
-- ------------     -----------
-- Iga Panggang     160000
-- Steak            120000
-- Iga Penyet       112000
-- Sop Tulang I     60000

SELECT menu_name, SUM(price) FROM trx_transaction_detail WHERE menu_id IN ( SELECT menu_id FROM trx_transaction_detail GROUP BY menu_id HAVING COUNT(*) > 1 ) GROUP BY menu_id;

-- Dari data tersebut, buatlah query untuk menampilkan data customer_name serta sudah berapa kali customer tersebut melakukan transaksi di Enigma Resto. Sehingga hasil query tersebut adalah

-- customer_name      total_transaction
-- ---------------    -----------------
-- Doni Octamalnan    1
-- Jution Kirana      1
-- Tika Yesi          2

-- cara 1
select customer_name , count(*) as total_transaction from trx_bill join mst_customer on trx_bill.customer_id = mst_customer.id group by customer_name;

-- cara 2
insert into trx_bill (transaction_date, paid_status, table_id, customer_id) values ('2022-06-10', 't', 'T001', '001');
select customer_name , count(*) as total_transaction from trx_bill join mst_customer on trx_bill.customer_id = mst_customer.id group by customer_name;