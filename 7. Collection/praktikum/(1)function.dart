void main(List<String> args) async {
  List data = [
    2,3,4,5,6,10
  ];
  int pengali = 4;
  List result = await perkalian(data, pengali);

  print(result);
}

Future<List> perkalian (List data, int pengali) async{
  var result = [];
  for(int item in data){
    result.add(item * pengali);
  }

  return await result;
}