-- Melanjutkan dari soal sebelumnya, anda sudah memiliki database enigma_resto. Selanjutnya, buatlah sebuah table mst_table dengan ketentuan sebagai berikut:
-- Table mst_table memiliki:
-- id dengan type data varchar panjang maksimal 100 dengan constraint primary key,
-- table_number dengan type data varchar dengan maksimal panjang karakter 50 dan tidak boleh kosong,
-- status dengan type data boolean dan tidak boleh kosong

-- create table mst_table (
--     id varchar(100) primary key,
--     table_number varchar(50) not null,
--     status boolean not null
-- );

-- Melanjutkan dari soal sebelumnya, anda sudah memiliki database enigma_resto. Selanjutnya, buatlah sebuah table mst_menu dengan ketentuan sebagai berikut:
-- Table mst_menu memiliki:
-- id dengan type data varchar panjang maksimal 100 dengan constraint primary key,
-- menu_name dengan type data varchar dengan maksimal panjang karakter 50 dan tidak boleh kosong,
-- price dengan type data integer dan tidak boleh kosong

create table mst_menu (
    id varchar(100) primary key,
    menu_name varchar(50) not null,
    price integer not null
);