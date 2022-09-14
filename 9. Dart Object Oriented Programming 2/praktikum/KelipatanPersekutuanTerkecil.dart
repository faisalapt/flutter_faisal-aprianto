import 'Matematika.dart';

class KelipatanPersekutuanTerkecil implements Matematika{
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

    for(i = y; i % x != 0 || i % y != 0; i++);
    return i;
  }
}