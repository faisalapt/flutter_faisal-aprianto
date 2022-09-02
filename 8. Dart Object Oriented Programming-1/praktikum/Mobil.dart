import 'Hewan.dart';

class Mobil {
  int kapasitas = 100;
  late List<Hewan> muatan;

  void tambahMuatan(Hewan hewan){
    this.muatan.add(hewan);
  }

  int totalMuatan(){
    int now = 0;
    for(var hewan in muatan){
      int ber = hewan.berat;
       now = now + ber;
    }

    return now;
  }
}