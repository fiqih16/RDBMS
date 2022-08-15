-- Pada materi DML bagian 1 anda sudah diajarkan bagaimana cara melakukan insert suatu data ke dalam table. Soal kali ini, anda akan dipersilahkan untuk melakukan insert data pada table mst_table yang berisi field kode tabel (varchar(100)), nomor tabel (varchar(50)), status (boolean) dengan minimal 5 data secara sekaligus.

-- Notes: true = 0 & false = 1

-- 1. Insert data ke dalam table mst_table
insert into mst_table (id, table_number, status) values ('1', '1', '0');
insert into mst_table (id, table_number, status) values ('2', '2', '0');
insert into mst_table (id, table_number, status) values ('3', '3', '0');
insert into mst_table (id, table_number, status) values ('4', '4', '0');
insert into mst_table (id, table_number, status) values ('5', '5', '0');

-- Pada materi DML bagian 1 anda sudah diajarkan bagaimana cara melakukan insert suatu data ke dalam table. Soal kali ini, anda akan dipersilahkan untuk melakukan insert data pada table mst_menu dengan field id (varchar), menu_name (varchar), price (int) minimal 5 data secara sekaligus.

-- 2. Insert data ke dalam table mst_menu
insert into mst_menu (id, menu_name, price) values ('1', 'Nasi Goreng', '10000');
insert into mst_menu (id, menu_name, price) values ('2', 'Nasi Goreng', '10000');
insert into mst_menu (id, menu_name, price) values ('3', 'Nasi Goreng', '10000');
insert into mst_menu (id, menu_name, price) values ('4', 'Nasi Goreng', '10000');
insert into mst_menu (id, menu_name, price) values ('5', 'Nasi Goreng', '10000');

-- Berdasarkan data diatas, tuliskan syntax untuk melakukan perubahan harga Iga Penyet dengan id M003 dari 56000 menjadi 59000
update mst_menu set price = 59000 where id = 'M003';

-- Berdasarkan data diatas, tuliskan syntax untuk melakukan perubahan data pada id M001 dari Iga Panggang dengan harga 80000 menjadi Iga Bakar dengan harga 70000
update mst_menu set id = 'M001', menu_name = 'Iga Bakar', price = 70000 where id = 'M001';

-- Dari data diatas, tuliskan syntax untuk menghapus data menu Iga Panggang dengan id M005
delete from mst_menu where id = 'M005';