-- Dari data diatas, anda diminta untuk dapat menentukan berapakah jumlah member yang aktif dan tidak aktif di enigma resto. Tuliskan query untuk menentukan data tersebut pada table mst_customer sehingga sample output untuk data tersebut adalah sebagai berikut:

-- Output dari query tersebut adalah: 
-- active_member  jumlah
-- -------------  ----------
-- 0              4
-- 1              3

select active_member, jumlah from ( select active_member, count(*) as jumlah from mst_customer group by active_member ) as t;

-- Dari data mst_customer diatas, anda diminta untuk menentukan berapakah jumlah member yang active pada enigma resto, sehingga output yang dihasilkan adalah

-- Keterangan: true pada code runner ini digantikan dengan 0 dan false pada code runner ini digantikan dengan 1
-- Output dari hasil running adalah :
-- active_member  jumlah
-- -------------  ----------
-- 0              4

SELECT active_member, jumlah FROM (
  SELECT active_member, count(*) AS jumlah FROM mst_customer
  GROUP BY active_member
) AS t WHERE t.active_member = 0;

-- Dari data mst_customer diatas, anda diminta untuk menentukan berapakah jumlah member yang active pada enigma resto namun yang tanggal joinnya diatas tanggal 1 bulan 1 tahun 2020, sehingga output yang dihasilkan adalah

-- Keterangan: true pada code runner ini digantikan 0 dan false pada code runner ini digantikan 1
-- Output pada soal ini adalah:
-- active_member  jumlah
-- -------------  ----------
-- 0              2

SELECT active_member, jumlah FROM (
    SELECT active_member, COUNT(*) AS jumlah FROM mst_customer WHERE active_member = 0 AND join_date > '2020-01-01' GROUP BY active_member
) AS t;