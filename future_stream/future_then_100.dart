import 'dart:async';

Future<int> futureNumber() {
  // 3초 후 100이 상자에서 나옵니다
  return Future<int>.delayed(Duration(seconds: 3), () {
    return 100;
  });
}

void main() {
  // future 라는 변수에서 미래에(3초 후에) int가 나올 것입니다
  print('start');
  
  //1. then을 사용하여 return값을 활용
  futureNumber().then((val) {print('val 1step: $val');});
  
  Future<int> future = futureNumber();
  print('middle');
  
  //2. Future type을 이용해서 then 사용하여 return값을 활용
  future.then((val) {
    // int가 나오면 해당 값을 출력
    print('val 2step: $val');
  }).catchError((error) {
    // error가 해당 에러를 출력
    print('error: $error');
  });

  print('기다리는 중');
}

/* 결과
start
middle
기다리는 중
val 1step: 100
val 2step: 100
*/