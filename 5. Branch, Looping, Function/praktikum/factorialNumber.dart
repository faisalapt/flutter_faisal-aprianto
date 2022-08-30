void main(List<String> args) {
  var angka = 30;
  var hasil = factorial(angka);
  print(hasil);
}

int factorial(int number){
  int total = 0;
  for(int i=0;i<number;number--){
    if(total == 0){
      total = number;
    }else{
      total *= number;
    }
  }
  return total;
}