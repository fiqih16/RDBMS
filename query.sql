CREATE SCHEMA master;

-- create table master type_dosen
CREATE TABLE master.type_dosen (
    id serial  primary key unique,
	kode_type_dosen varchar(4),
	description varchar(255)
);
ALTER TABLE master.type_dosen ADD CONSTRAINT uk_kode_dosen UNIQUE(kode_type_dosen);
INSERT INTO master.type_dosen(kode_type_dosen, description) VALUES ('T001', 'Tetap');
INSERT INTO master.type_dosen(kode_type_dosen, description) VALUES ('T002', 'Honorer');
INSERT INTO master.type_dosen(kode_type_dosen, description) VALUES ('T003', 'Expertise');
SELECT * FROM master.type_dosen;

-- create table master jurusan
CREATE TABLE master.jurusan (
	id serial primary key unique,
	kode_jurusan VARCHAR(4),
	nama_jurusan VARCHAR(255),
	status_jurusan VARCHAR(50)
);
ALTER TABLE master.jurusan ADD CONSTRAINT uk_kode_jurusan UNIQUE(kode_jurusan);
INSERT INTO master.jurusan(kode_jurusan, nama_jurusan, status_jurusan) VALUES ('J001','Teknik Informatika', 'Aktif');
INSERT INTO master.jurusan(kode_jurusan, nama_jurusan, status_jurusan) VALUES ('J002','Sistem Informasi', 'Non Aktif');
INSERT INTO master.jurusan(kode_jurusan, nama_jurusan, status_jurusan) VALUES ('J003','Sistem Komputer','Aktif');
INSERT INTO master.jurusan(kode_jurusan, nama_jurusan, status_jurusan) VALUES ('J004','Komputer Akuntansi','Non Aktif');
INSERT INTO master.jurusan(kode_jurusan, nama_jurusan, status_jurusan) VALUES ('J005','Management Informatika', 'Aktif');
SELECT * FROM master.jurusan;

-- create table master ujian
CREATE TABLE master.ujian (id serial primary key unique,
	kode_ujian VARCHAR(5),
	nama_ujian VARCHAR(255),
	status_ujian VARCHAR(50)
);
ALTER TABLE master.ujian ADD CONSTRAINT uk_kode_ujian UNIQUE(kode_ujian);
INSERT INTO master.ujian(kode_ujian, nama_ujian, status_ujian) VALUES ('U0001', 'Algoritma', 'Aktif');
INSERT INTO master.ujian(kode_ujian, nama_ujian, status_ujian) VALUES ('U0002', 'Aljabar', 'Aktif');
INSERT INTO master.ujian(kode_ujian, nama_ujian, status_ujian) VALUES ('U0003', 'Statistika', 'Non Aktif');
INSERT INTO master.ujian(kode_ujian, nama_ujian, status_ujian) VALUES ('U0004', 'Etika Profesi', 'Non Aktif');
INSERT INTO master.ujian(kode_ujian, nama_ujian, status_ujian) VALUES ('U0005', 'Bahasa Inggris', 'Aktif');
SELECT * FROM master.ujian;

-- create table master.agama
CREATE TABLE master.agama (
	id serial primary key,
	kode_agama VARCHAR(4) UNIQUE,
	description VARCHAR(255)
);
ALTER TABLE master.agama ADD CONSTRAINT uk_kode_agama UNIQUE(kode_agama);
INSERT INTO master.agama(kode_agama, description) VALUES ('A001', 'Islam');
INSERT INTO master.agama(kode_agama, description) VALUES ('A002', 'Kristen');
INSERT INTO master.agama(kode_agama, description) VALUES ('A003', 'Katolik');
INSERT INTO master.agama(kode_agama, description) VALUES ('A004', 'Hindu');
INSERT INTO master.agama(kode_agama, description) VALUES ('A005', 'Budha');
SELECT * FROM master.agama;

-- create table dosen
CREATE TABLE dosen (
	id serial primary key,
	kode_dosen VARCHAR(4) UNIQUE,
	nama_dosen VARCHAR(255),
	kode_jurusan VARCHAR(4),
	kode_type_dosen VARCHAR(4),
	kode_jurusan_id INT,
	kode_type_dosen_id INT
);
ALTER TABLE dosen ADD CONSTRAINT fk_type_dosen_id FOREIGN KEY (kode_type_dosen_id) REFERENCES master.type_dosen(id);
INSERT INTO dosen(kode_dosen, nama_dosen, kode_jurusan, kode_type_dosen, kode_jurusan_id, kode_type_dosen_id) VALUES ('D001', 'Prof. Dr. Retno Wahyuningsih', 'J001', 'T002', 1,2);
INSERT INTO dosen(kode_dosen, nama_dosen, kode_jurusan, kode_type_dosen, kode_jurusan_id, kode_type_dosen_id) VALUES ('D002', 'Prof. Roy M.Sutikno', 'J002', 'T001', 2,1);
INSERT INTO dosen(kode_dosen, nama_dosen, kode_jurusan, kode_type_dosen, kode_jurusan_id, kode_type_dosen_id) VALUES ('D003', 'Prof. Hendri A. Verburgh', 'J003', 'T002', 3,2);
INSERT INTO dosen(kode_dosen, nama_dosen, kode_jurusan, kode_type_dosen, kode_jurusan_id, kode_type_dosen_id) VALUES ('D004', 'Prof. Risma Suparwata', 'J004', 'T002', 4,2);
INSERT INTO dosen(kode_dosen, nama_dosen, kode_jurusan, kode_type_dosen, kode_jurusan_id, kode_type_dosen_id) VALUES ('D005', 'Prof. Amir Sjarifuddin Madjid, MM, MA', 'J005', 'T001', 5,1);
SELECT * FROM dosen;
SELECT nama_dosen, kode_jurusan, kode_type_dosen,
       (select nama_jurusan from master.jurusan where id=dosen.kode_jurusan_id) as nama_jurusan,
       (select description from master.type_dosen where id=dosen.kode_type_dosen_id) as status
FROM dosen;

-- craete table mahasiswa
CREATE TABLE mahasiswa (
	id SERIAL PRIMARY KEY,
	kode_mahasiswa VARCHAR(255) UNIQUE,
	nama_mahasiswa VARCHAR(255),
	alamat VARCHAR(255),
	kode_agama VARCHAR(4),
	kode_jurusan VARCHAR(4),
	kode_agama_id INT,
	kode_jurusan_id INT
);
ALTER TABLE mahasiswa ADD CONSTRAINT fk_agama_id FOREIGN KEY (kode_agama_id) REFERENCES master.agama(id);
ALTER TABLE mahasiswa ADD CONSTRAINT fk_jurusan_id FOREIGN KEY (kode_jurusan_id) REFERENCES master.jurusan(id);
INSERT INTO mahasiswa(kode_mahasiswa, nama_mahasiswa, alamat, kode_agama, kode_jurusan, kode_agama_id, kode_jurusan_id) VALUES ('M001', 'Budi Gunawan', 'Mawar No 3 RT 05 Cicalengka, Bandung', 'A001', 'J001', 1,1);
INSERT INTO mahasiswa(kode_mahasiswa, nama_mahasiswa, alamat, kode_agama, kode_jurusan, kode_agama_id, kode_jurusan_id) VALUES ('M002', 'Rinto Raharjo', 'Kebagusan No. 33 RT04 RW06 Bandung', 'A002', 'J002',2,2);
INSERT INTO mahasiswa(kode_mahasiswa, nama_mahasiswa, alamat, kode_agama, kode_jurusan, kode_agama_id, kode_jurusan_id) VALUES ('M003', 'Asep Saepudin', 'Sumatera No. 12 RT02 RW01, Ciamis', 'A003', 'J003',3,3);
INSERT INTO mahasiswa(kode_mahasiswa, nama_mahasiswa, alamat, kode_agama, kode_jurusan, kode_agama_id, kode_jurusan_id) VALUES ('M004', 'M. Hafif Isbullah', 'Jawa No 01 RT01 RW01, Jakarta Pusat', 'A004', 'J004',4,4);
INSERT INTO mahasiswa(kode_mahasiswa, nama_mahasiswa, alamat, kode_agama, kode_jurusan, kode_agama_id, kode_jurusan_id) VALUES ('M005', 'Cahyono', 'Niagara No. 54 RT01 RW09, Surabaya', 'A005', 'J005',5,5);
SELECT * FROM mahasiswa;
SELECT nama_mahasiswa,
       alamat, kode_agama,
       kode_jurusan,
       (select description from master.agama where id=mahasiswa.kode_agama_id) as nama_agama,
       (select nama_jurusan from master.jurusan where id=mahasiswa.kode_jurusan_id) as nama_jurusan
FROM mahasiswa;

-- create table nilai
CREATE TABLE nilai (
	id SERIAL PRIMARY KEY,
	kode_mahasiswa VARCHAR(4),
	kode_ujian VARCHAR(4),
	nilai INT,
	kode_mahasiswa_id INT,
	kode_ujian_id INT
);
ALTER TABLE nilai ADD CONSTRAINT fk_mahasiswa_id FOREIGN KEY (kode_mahasiswa_id) REFERENCES mahasiswa(id);
INSERT INTO nilai(kode_mahasiswa, kode_ujian, nilai, kode_mahasiswa_id, kode_ujian_id) VALUES ('M001', 'U001', '90', 1,1);
INSERT INTO nilai(kode_mahasiswa, kode_ujian, nilai, kode_mahasiswa_id, kode_ujian_id) VALUES ('M002', 'U002', '80', 2,2);
INSERT INTO nilai(kode_mahasiswa, kode_ujian, nilai, kode_mahasiswa_id, kode_ujian_id) VALUES ('M003', 'U003', '85', 3,3);
INSERT INTO nilai(kode_mahasiswa, kode_ujian, nilai, kode_mahasiswa_id, kode_ujian_id) VALUES ('M004', 'U004', '95', 4,4);
INSERT INTO nilai(kode_mahasiswa, kode_ujian, nilai, kode_mahasiswa_id, kode_ujian_id) VALUES ('M005', 'U005', '70', 5,5);
ALTER TABLE nilai ADD CONSTRAINT fk_ujian_id FOREIGN KEY (kode_ujian_id) REFERENCES master.ujian(id);
SELECT * FROM nilai;
SELECT kode_mahasiswa,
       kode_ujian,
       nilai.nilai,
       (select nama_mahasiswa from mahasiswa where id=nilai.kode_mahasiswa_id) as nama_mahasiswa,
       (select nama_ujian from master.ujian where id=nilai.kode_ujian_id) as nama_ujian
FROM nilai;