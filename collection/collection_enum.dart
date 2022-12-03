/*
enum ItemCode {
  //미세먼저, 초미세먼지, 오전,일산화탄소, 이황산가스
  PM10,
  PM25,
  NO2,
  O3,
  SO2
}

  itemCode = parseItemCode(json['itemCode']); 


  //static으로 정의를 해야 위 constructor에서 사용할 수 있다.
  static ItemCode parseItemCode(String raw) {
    //json의 값중 PM25는 실제 값은 PM2.5로 들어 오기 때문에 아래처럼 IF을 해 줬음
    if (raw == 'PM2.5') {
      return ItemCode.PM25;
    }
    return ItemCode.values.firstWhere((element) => element.name == raw);

    //ItemCode.NO2.name; //이 결과는 'NO2' string형으로 return된다.
    //ItemCode.NO2.toString(); //이 결과는 'ItemCode.NO2'과 같이 return된다.
  }
*/

/*
  enum
  - 열거형의 명칭은 첫 문자를 대문자로 쓰는 게 관례이다. 
  - 한정되고, 명확한 상수의 집합
*/
void main() {
  enumStudy();
}

//----------------------------------------------------------------------
//1. enum
//----------------------------------------------------------------------
enum Color { red, black, yellow }

void enumStudy() {
  //********************************************************************
  //1. 반복수행관련(loop, 다른Colleciton으로 변환) method
  //********************************************************************
  //1.1 forEach
  Color.values.forEach(print); //Color.red    Color.black    Color.yellow

  Color.values.forEach((v) => print('1.2 value: $v, index: ${v.index}'));
  /* 결과
    1.1 value: Color.red, index: 0
    1.1 value: Color.black, index: 1
    1.1 value: Color.yellow, index: 2  
  */

  //1.2 list, set으로 변환하기
  var colorList = Color.values.toList();
  var colorSet = Color.values.toSet();

  //********************************************************************
  //2. enum값 읽기
  //********************************************************************
  //2.1 vlaues
  print('2.1 values = ${Color.values}'); //[Color.red,Color.black Color.yellow]
  //2.2 index
  print('2.2 Color.red.index = ${Color.red.index}'); //0
  //2.3 name
  print('2.3 Color.red.name = ${Color.red.name}'); //red

  //********************************************************************
  //3. 형변환 및 비교
  //********************************************************************
  //3.1 toString()
  print(
      '3.1 Color.red.toString() == "Color.red" = ${Color.red.toString() == "Color.red"}'); //true

  //3.2 enum값 비교하기
  Color color2 = Color.black;
  if (color2 == Color.black) {
    print("3.2 color2 == Color.black = ${color2 == Color.black}"); //true
  }

  //********************************************************************
  //9. 기타
  //********************************************************************
  //9.1 firstWhere() : 문자형처럼 비교하고 좋은 함수.
  var temp1 = Color.values.firstWhere((element) => element.name == 'black');
  print('9.1 firstWhere : $temp1'); //Color.black
}
