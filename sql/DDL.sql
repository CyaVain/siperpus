CREATE TABLE roles(
id INT PRIMARY KEY AUTO_INCREMENT,
role varchar(20) NOT NULL
);

CREATE TABLE members(
id INT PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR(40) NOT NULL,
no_ktp INT NOT NULL,
no_hp VARCHAR(15) NOT NULL,
alamat_jalan VARCHAR(100) NOT NULL,
alamat_kota VARCHAR(50) NOT NULL,
alamat_pronvisi VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(20) NOT NULL,
session VARCHAR(255) NOT NULL,
roles_id INT NOT NULL,
FOREIGN KEY (roles_id) REFERENCES roles(id)
);

CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
kode VARCHAR(20) NOT NULL,
nama VARCHAR(50) NOT NULL
);

CREATE TABLE books(
id INT PRIMARY KEY AUTO_INCREMENT,
isbn VARCHAR(50) NOT NULL,
judul VARCHAR(255) NOT NULL,
pengarang VARCHAR(50) NOT NULL,
penerbit VARCHAR(50) NOT NULL,
tahun_terbit YEAR NOT NULL,
jumlah_ketersediaan INT NOT NULL,
categories_id INT NOT NULL,
FOREIGN KEY (categories_id) REFERENCES categories(id)
);

CREATE TABLE order_details(
id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT NOT NULL,
FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE orders(
id INT PRIMARY KEY AUTO_INCREMENT,
no_order VARCHAR(255) NOT NULL,
tanggal_order DATE NOT NULL,
tanggal_pengembalian DATE NOT NULL,
denda INT,
member_id INT NOT NULL,
order_details_id INT NOT NULL,
FOREIGN KEY (order_details_id) REFERENCES order_details(id),
FOREIGN KEY (member_id) REFERENCES members(id)
);
