

void main(){

  print('구구단');
  var result = 0;

  for(int i=0; i<=9; i++){
    print('$i단');
        for(int j=0; j<=9; j++){
          result = i*j;
          print('$i*$j = $result');
        }
  }
}

