console.log("---Tiket Masuk Zoo---");

let pengunjung = [
    {nama: "Iyan", umur: 4},
    {nama: "joko", umur: 35},
    {nama: "siti", umur: 17},
    {nama: "budi", umur: 80}
];

let hargatiket = 10000;

for (let i = 0; i < pengunjung.length; i++) {
    let namaPengunjung = pengunjung[i].nama;
    let umur = pengunjung[i].umur;
    let pesan = "";

    if (umur < 5) {
        pesan = "Free ! Untuk balita";
    } else if (umur <= 12) {
        pesan = "Diskon 50% harga tiket: " + (hargatiket / 2);
    } else if (umur >= 60) {
        pesan = "Diskon 30% harga tiket: " + (hargatiket * 0.7);
    } else {
        pesan = "Harga normal : " + hargatiket;
    }

    console.log("\nNama Pengunjung: " + namaPengunjung);
    console.log("Umur: " + umur + " tahun");
    console.log("Keterangan : " + pesan);
}