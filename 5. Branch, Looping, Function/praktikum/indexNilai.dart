void main(List<String> args) {
  int nilai = 70;

  
  String indexNilai = calculate(nilai);

  print(indexNilai);
}

String calculate(nilai){
  String ind = '';
  if(nilai > 70){
    ind = "A";
  }else if(nilai > 40 && nilai <= 70){
    ind = "B";
  }else if(nilai < 40){
    ind = "C";
  }

  return ind;
}