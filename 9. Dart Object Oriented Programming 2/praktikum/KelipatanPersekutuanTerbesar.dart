import 'Matematika.dart';

class KelipatanPersekutuanTerbesar extends Matematika{
  int x = 0;
  int y = 0;

  @override
  int hasil(){
    int i = 0;
    if(x > y){
      i = x;
      x = y;
      y = i;
    }

    while(x > 0){
      i = y % x;
      y = x;
      x = i;
    }

    return y;
  }
}