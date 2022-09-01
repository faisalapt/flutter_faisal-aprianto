void main(List<String> args) {
  List data =[
    'Faisal Aprianto',
    '21',
  ];
  List element = [
    'Universitas Multimedia Nusantara',
    'Informatika'
  ];
  data.add(element);
  var map = {
    'nama' : data[0],
    'umur' : data[1],
    'kampus' : {
      'nama' : data[2][0],
      'jurusan' : data[2][1]
    }
  };
  print(map);
}