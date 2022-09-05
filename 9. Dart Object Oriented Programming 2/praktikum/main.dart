import 'Balok.dart';
import 'KelipatanPersekutuanTerbesar.dart';
import 'KelipatanPersekutuanTerkecil.dart';
import 'Kubus.dart';

void main(List<String> args) {
  var kubus = Kubus();
  print(kubus);
  kubus.sisi = 4;
  print(kubus.volume());

  var balok = Balok();
  print(balok);
  balok.lebar = 3;
  balok.panjang = 4;
  balok.tinggi = 5;
  print(balok.volume());

  var kpk = KelipatanPersekutuanTerkecil();
  print(kpk);
  kpk.x = 10;
  kpk.y = 20;
  print(kpk.hasil());

  var fpb = KelipatanPersekutuanTerbesar();
  print(fpb);
  fpb.x = 16;
  fpb.y = 40;
  print(fpb.hasil());
}