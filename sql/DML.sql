INSERT INTO categories(kode, nama)
VALUES("FIC","Fiction"),
("SCI-FIC","Science-Fiction"),
("ROM-COM","Romance-Comedy"),
("DRM","Drama"),
("ACT","Action"),
("CHD","Children");

INSERT INTO books(isbn,judul,pengarang,penerbit,tahun_terbit,jumlah_ketersediaan,categories_id)
VALUES('978-3-16-148410-0', 'The Great Adventure', 'John Doe', 'Adventure Books', 2021, 10, 1),
('978-1-40-289462-6', 'Sci-Fi World', 'Jane Smith', 'Futuristic Press', 2020, 25, 2),
('978-0-14-143956-3', 'Love and Laughs', 'Emily Bronte', 'Romantic Times', 2019, 7, 3),
('978-1-93-398817-7', 'Drama in Real Life', 'Arthur Miller', 'Drama Publishers', 2018, 4, 4),
('978-0-452-28423-4', 'Action Packed', 'Jack Reacher', 'Action House', 2022, 8, 5),
('978-0-316-76948-8', 'Kids Fun Stories', 'Dr. Seuss', 'Children World', 2017, 15, 6),
('978-0-7432-7356-5', 'Mystery of the Lost', 'Agatha Christie', 'Mystery Press', 2016, 6, 1),
('978-1-4028-9462-8', 'Future Tense', 'Isaac Asimov', 'Sci-Fi Universe', 2015, 9, 2),
('978-0-452-28424-1', 'Romantic Journey', 'Nicholas Sparks', 'Heart Publishers', 2023, 3, 3),
('978-0-06-112008-4', 'Life Drama', 'Tennessee Williams', 'Classic Drama', 2021, 3, 4);

INSERT INTO roles (role)
VALUES("MEMBER"), ("ADMIN");

INSERT INTO members(nama, no_ktp, no_hp, alamat_jalan, alamat_kota, alamat_provinsi, email, password, roles_id)
VALUES
('Ahmad Santoso', '3276010101010001', '081234567890', 'Jl. Merdeka No. 1', 'Bandung', 'Jawa Barat', 'ahmad.santoso@example.com', 'password123', 1),
('Budi Hartono', '3174010202020002', '082234567891', 'Jl. Sudirman No. 5', 'Jakarta', 'DKI Jakarta', 'budi.hartono@example.com', 'password123', 1),
('Citra Dewi', '3273020303030003', '083234567892', 'Jl. Diponegoro No. 10', 'Bekasi', 'Jawa Barat', 'citra.dewi@example.com', 'password123', 2),
('Dewi Lestari', '3374010404040004', '084234567893', 'Jl. Ahmad Yani No. 15', 'Semarang', 'Jawa Tengah', 'dewi.lestari@example.com', 'password123', 1),
('Eko Prasetyo', '3175030505050005', '085234567894', 'Jl. Gatot Subroto No. 20', 'Jakarta', 'DKI Jakarta', 'eko.prasetyo@example.com', 'password123', 2);

INSERT INTO orders(no_order, tanggal_order, tanggal_pengembalian, member_id, returned)
VALUES('ORD001', '2024-05-01', '2024-05-15', 1, false), 
('ORD002', '2024-05-03', '2024-05-17', 2, false), 
('ORD003', '2024-05-04', '2024-05-19', 3, false),
('ORD004', '2024-05-21', '2024-05-26', 3, false);

INSERT INTO order_details(order_id,book_id)
VALUES(1,1),(1,2),(1,3),
(2,4),(2,5),(2,6),
(3,7),(3,8),(4,9);

UPDATE orders
SET returned = true, denda = 0
WHERE id in (1,2,3);

UPDATE orders
SET returned = true, denda = 5000
WHERE id = 4;