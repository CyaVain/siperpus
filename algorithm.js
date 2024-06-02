var listBuku = [
    {
        id: 1,
        isbn: "9780141182551",
        penerbit: "Penguin Books",
        pengarang: "Albert Camus",
        tahunTerbit: 1942,
        judul: "The Stranger"
    },
    {
        id: 2,
        isbn: "9780061120084",
        penerbit: "Harper Perennial Modern Classics",
        pengarang: "Gabriel Garcia Marquez",
        tahunTerbit: 1967,
        judul: "One Hundred Years of Solitude"
    },
    {
        id: 3,
        isbn: "9780679720201",
        penerbit: "Vintage International",
        pengarang: "Haruki Murakami",
        tahunTerbit: 1987,
        judul: "Norwegian Wood"
    },
    {
        id: 4,
        isbn: "9780140182078",
        penerbit: "Penguin Books",
        pengarang: "Franz Kafka",
        tahunTerbit: 1915,
        judul: "The Metamorphosis"
    },
    {
        id: 5,
        isbn: "9780679755333",
        penerbit: "Vintage",
        pengarang: "Toni Morrison",
        tahunTerbit: 1987,
        judul: "Beloved"
    }
];

const batasMaxPinjam = 14
const dendaHarian = 1000
const dendaMax = 30000

//FORMAT DATE YYYY-MM-DD
var tanggalPinjam = new Date( "2024-10-15" )
var tanggalKembali = new Date( "2024-10-14" )
var bukuYangDiPinjam = [1,2,4]

var dendaPerBuku = []

function hitungDenda(tanggalPinjam,tanggalKembali, bukuYangDiPinjam){
    // Validasi Tanggal Pengembalian
    if(tanggalKembali < tanggalPinjam){
        return console.log("## Tanggal Pengembalian Tidak Boleh Kurang Dari Tanggal Pinjam ##")
    }
    // Validasi Jumlah Buku Yang Dipinjam
    if(bukuYangDiPinjam.length > listBuku.length){
        return console.log("## Jumlah Buku Yang Dipinjam Lebih Banyak Dari Ketersediaan Buku ##")
    }

    // Validasi Buku Yang Dipinjam
    for(var i = 0 ; i < bukuYangDiPinjam.length ; i++){
        var buku = listBuku.find(function(b){
            return b.id === bukuYangDiPinjam[i]
        })

        if(!buku){
            return console.log("## BUKU TIDAK VALID / TIDAK ADA ##")
        }

        // Jika Meminjam Buku Yang Sama
    var checker = []
    for(var i = 0; i < bukuYangDiPinjam.length; i++){
        if(checker.includes(bukuYangDiPinjam[i])){
            return console.log("## BUKU YANG SAMA TIDAK BISA DIPINJAM BERSAMAAN")
        }
        else checker[i] = bukuYangDiPinjam[i]
    }

    // Hitung Selisih
    var selisih = tanggalKembali.getDate() - tanggalPinjam.getDate()
    if(selisih <= batasMaxPinjam){
        console.log("## Pinjaman Tidak Dikenakan Kenda Apapun Dikarenakan Pengembalian Masih Dibawah Dari Maximal Pengembalian ##")
        return console.log(`Durasi Pinjaman : ${selisih} Hari`)
    }

    // Menghitung Denda
    var denda = ((selisih - batasMaxPinjam) * dendaHarian) * bukuYangDiPinjam.length
    if(denda > dendaMax) denda = 30000
    
    var totalDenda = 0;
    bukuYangDiPinjam.forEach(function(e){
        var buku = listBuku.find(function(b){
            if(b.id === e){
                return b
            }
        })
        var b = {}
        b.id = buku.id
        b.judul = buku.judul
        b.denda = denda
        dendaPerBuku.push(b)

        totalDenda += denda
    })

    return {totalDenda, dendaPerBuku}
    }
}
