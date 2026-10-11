class Motor{
    private nomorMesin: string;

    constructor(nomorMesin: string) {
        this.nomorMesin = nomorMesin;
    }
    public tampilkanNomorMesin():
    void{
        console.log("Nomor Mesin:",this.nomorMesin);
        }
    } 
    const motor = new
    Motor("MX-123");


abstract class Kendaraan{
    abstract bergerak():void;
}{
}
class Sepeda extends Kendaraan{
    bergerak(): void {
        console.log("Sepeda digayuh");
    }
}
const sepeda = new Sepeda();
sepeda.bergerak();


class Hewan{
    nama : string;
    constructor(nama: string){
        this.nama = nama;
    }
    makan () : void{
        console.log(this.nama + " sedang makan");
    }
}
    class Kucing extends Hewan{
        
    }

const kucing = new Kucing("Mimi");
kucing.makan();

    // node module node project


