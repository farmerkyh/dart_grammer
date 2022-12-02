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