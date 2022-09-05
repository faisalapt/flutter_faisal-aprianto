import 'BangunRuang.dart';

class Kubus extends BangunRuang {
  int sisi = 0;

  @override
  int volume(){
    int vol = sisi * sisi * sisi;
    return vol;
  }
}