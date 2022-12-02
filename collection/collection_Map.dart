void main() {
  //1. Map 활용편
  mapStudy();
}

//----------------------------------------------------------------------
//1. Map 활용편
//   - key값을 기준으로 중복허용하지 않는다.
//   - Map은 순서를 보장하지 않는다.  (https://kimmanbo.tistory.com/19)
//----------------------------------------------------------------------
void mapStudy() {
  Map<String, String> harryPotter = {'Harry': '해리', 'Ron': 'Ron', 'Hermione': '헤르미온느'};

  //********************************************************************
  //1. 반복수행관련(loop, 다른Colleciton으로 변환) method
  //********************************************************************
  print('1 ----------------------------------------------------------');
  //1.1. Map.map() : Map을 순환한다. (looping)
  final result = harryPotter.map(
    (key, value) => MapEntry('$key Potter', '$value 캐릭터'),
  );
  print('1.1 Map.map() : result=$result}');
  //{Harry Potter: 해리 캐릭터, Ron Potter: 론 캐릭터, Hermione Potter: 헤르미온느 캐릭터}

  //1.2 Map.forEach() : Map의 length만큼 반복수행
  result.forEach((key, value) {
    print('1.2 Map.forEach() : key=$key,  value:$value');
  });

  //1.3 Map.entries : Map을 for 로 수행하여 모든 key,value얻기
  //    harryPotter.map()과 동일 방식이지만,
  //    harryPotter.map()문법이 flutter에서 개발도중 적용이 안되는 경우에 harryPotter.entries를 적용하면 된다.
  for (var element in harryPotter.entries) {
    print('1.3 Map.entries : key=${element.key},  value=${element.value}');
  }

  //1.4. Map.key : key값을 추출 후
  final keys1 = harryPotter.keys; //a. Map에서 key만 iterator로 얻기
  final keys2 = harryPotter.keys.map((x) => '$x Chacrator'); //b. Map에서 key만 map()으로 looping하기
  final keys3 = harryPotter.keys.map((x) => '$x Chacrator').toList(); //c. Map에서 key만 List로 만들기

  print('1.4 Map.key : keys1=$keys1'); //(Harry, Ron, Hermione)
  print('1.4 Map.key : keys2=$keys2'); //(Harry Chacrator, Ron Chacrator, Hermione Chacrator)
  print('1.4 Map.key : keys3=$keys3'); //[Harry Chacrator, Ron Chacrator, Hermione Chacrator]

  //1.5 Map.values : values값을 이용해서 interator, List등으로 얻기
  //harryPotter.values -> (위 Map.key 문법과 동일)
  //harryPotter.values.map()

  //********************************************************************
  //2. 검증관련 method
  //********************************************************************
  print('2 ----------------------------------------------------------');
  //2.1 Map.containsKey() : key가 포함되어 있는지 확인여부
  bool flag1 = harryPotter.containsKey('Harry');
  print('2.1 Map.containsKey() : flag1=$flag1'); //true

  //2.2 Map.containsValue() : values가 포함되어 있는지 확인 여부
  bool flag2 = harryPotter.containsValue('해리');
  print('2.2 Map.containsValue() : flag2=$flag2'); //true

  //********************************************************************
  //3. 조작(추가,복사)관련 method
  //********************************************************************
  print('3 ----------------------------------------------------------');
  //3.1 Map[] : 해당 key값이 미존재시 추가, 존재 시 수정
  harryPotter['HarryFirst'] = '해리First'; //추가됨
  harryPotter['Harry'] = '해리해리'; //수정됨
  print('3.1 Map[] : harryPotter=$harryPotter');

  //3.2 Map.from() : Map복사 (harryPotter와 harryCopy는 다른 객체로 인식한다.)
  Map<String, String> harryCopy = Map.from(harryPotter);
  harryCopy['Farmer'] = '농부';

  //3.3 Map.addAll() : 기존Map에 다른 Map을 추가한다.
  //                 : 참고, 반드시 Map<String, String> 이와 같은 type으로 정의 해야 된다.
  //                 : var type과 같은 dynamic type으로 정의시 addAll()문법에서 오류가 발생할 수 있다.
  //                 : addAll()의 return type은 void() 이다.
  var twoHarry = {}
    ..addAll(harryPotter)
    ..addAll(harryCopy);
  print('3.3 Map.addAll() : twoHarry=$twoHarry');
  //harryPotter.addAll({'Farmer':'농부'});
  harryPotter..addAll(harryCopy);
  print('3.3 Map.addAll() : harryPotter=$harryPotter');

  //3.4 map = map; : map자료를 복사하기
  //                 map type을 다른 map 변수에 넣으면, 값 복사가 아닌, reference복사(주소복사) 이다.
  //                 그래서, 아래 alphabets, eng 변수는 같은 주소를 바로 보고 있고
  //                 eng의 값을 변경하게 되면, 두 변수는 동일한 값을 유지하게 된다.
  var alphabets = ['a', 'b', 'c', 'd', 'e'];
  var eng = alphabets;
  eng.remove('a');
  eng.remove('b');
  print('3.4 map = map : alphabets=$alphabets'); //c,d,e

  //3.5 Map.addEntries(newEntries) : 기존Map에 다른 Map을 추가한다.
  //                                 Map에대한 type은 동일해야 된다.
  var planets = {'1': 'Mercury', '2': 'Venus'};
  harryPotter.addEntries(planets.entries);
  print('3.5 Map.addEntries() : harryPotter=$harryPotter');

  //********************************************************************
  //4. 조작(수정,삭제 등)관련 method
  //********************************************************************
  print('4 ----------------------------------------------------------');
  //4.1 Map.update(key, (value) => null) : 해당 key값이 미존재시 추가, 존재 시 수정
  harryPotter.update('Harry', (value) => '$value potter');
  print('4.1 Map.update() : harryPotter=$harryPotter');

  //4.2 Map.updateAll((key, value) => null) : 모든 value의 값을 수정한다.
  //                                        : 문자형변경, 숫자형은 +, - 등을 할 수 있다.
  harryPotter.updateAll((key, value) => value.toUpperCase()); //value를 대문자로 변경
  print('4.2 Map.updateAll() : harryPotter=$harryPotter');

  //4.3 Map.putIfAbsent(key, () => null) : key값이 부재중이면 put(추가)해라. 존재 skip.
  harryPotter.putIfAbsent('Farmer', () => '농부');
  print('4.3 Map.putIfAbsent() : harryPotter=$harryPotter');

  //4.4 Map.remove() : key값을 기준으로 Map에서 삭제 한다.
  //                   return결과로 key값에 대한 value가 return된다.
  var removeRtn = harryPotter.remove('Harry');
  print('4.4 Map.remove() : removeRtn=$removeRtn'); //해리해리포터
  print('4.4 Map.remove() : harryPotter=$harryPotter');

  //4.5 Map.removeWhere() : 조건을 설정해 key 또는 value를 기준으로 true이면 삭제한다.
  //                        return결과는 void이다.
  harryPotter.removeWhere((key, value) => value == '농부');
  harryPotter.removeWhere((key, value) => key == 'Farmer');
  print('4.5 Map.removeWhere() : harryPotter=$harryPotter');

  //4.6 Map.clear() : Map을 clear한다.
  //                  clear한다고 해서 null은 아니고, Map type은 유지 한다. ({});
  harryPotter.clear();
  print('4.6 Map.clear() : harryPotter=$harryPotter'); //

  //********************************************************************
  //9. 기타 method
  //********************************************************************
  print('9 ----------------------------------------------------------');
  var planets3 = {'1': 'Mercury', '2': 'Venus'};
  //9.1 Map.runtimeType : map의 type 알아보기
  print('planets3.runtimeType=${planets3.runtimeType}'); //결과 : _InternalLinkedHashMap<String, String>

  //9.2 Map.castFrom : Map형변환
  //var planets4 = Map.castFrom<String, String, int, String>(planets3); //개발 실패 ㅠㅠ. error 발생.

  //9.3 Map.hashCode : ??
  print('99 Map.hashCode : harryPotter.hashCode=${harryPotter.hashCode}'); //결과:438928743

  //9.4
  // harryPotter.cast()
  // harryPotter.noSuchMethod(invocation)

  //9.5
  /* 
    harryPotter.isEmpty : map이 비어 있는지 여부. '{}'
    harryPotter.isNotEmpty : map비어 있지 않은지 여부.
    harryPotter.length : map 갯수
  */

  //9.6
  /*
    Map.from(other)
    Map.fromEntries(entries)
    Map.fromIterable(iterable)
    Map.fromIterables(keys, values)
    Map.identity()
    Map.of(other)
    Map.unmodifiable(other)
  */
}
