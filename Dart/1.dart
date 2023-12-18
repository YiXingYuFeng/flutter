void main(){
  var name = 'djasjdi';
  var year = 1998;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print('hello, world');
  if(year >= 2001){
    print('1');
  }else{
    print('2');
  }
  // while(year<2016){
  //   year+=1;
  //   print(year);
  // }
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(20);
  print(result);

  flybyObjects.where((name) => name.contains('turn')).forEach(print);


}



