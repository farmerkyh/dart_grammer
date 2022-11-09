import 'dart:async';

/*
 async -> return Future<> : 일회성 응답에 사용
 async* -> return Stream<> : 여러번 가져올때 사용
 
 async* : 게으른 연산. 요청이 있을 때는 연산을 미루다가 함수에서 사용시 연산함 
 Stream : 파이프 개념
          전달가능 type : 일반값, 이벤트, 객체, 컬렉션, 맵, 오류, 다른스트림에서 모든 유형의 데이터가 스트림에 의해 전달 가능
 yield : return과 비슷하게 값을 반환해주는데 한번에 하나씩 return함과 동시에 
         함수가 종료되지 않고 계속 열려있으면서 지속적으로 return해줌
 
 참고 URL : https://beomseok95.tistory.com/308
*/
Stream<int> countSream(int to) async* {
	for(int i=1; i<=to; i++) {
		print('countSream : $i');
		yield i;
	}
}

Future<int> sumStream(Stream<int> stream) async {
	var sum = 0;
  print('sumStream start');  //한번만 실행 됨
  
  //최종결과를 봐선 stream에 값이 넘겨져 올 경우 아래 문장을 수행하는 원리임
	await for(var value in stream) {
		print('value: $value');
		sum += value;
	}
	return sum;
}

main() async{
	var stream = countSream(5);
  print('countSream end');  //한번만 실행 됨
  //print('stream : $stream'); //결과 : stream : Instance of '_ControllerStream<int>'
	var sum = await sumStream(stream);
	print(sum);
}

/* 최종결과
countSream end
sumStream start
countSream : 1
value: 1
countSream : 2
value: 2
countSream : 3
value: 3
countSream : 4
value: 4
countSream : 5
value: 5
15
 
 */
