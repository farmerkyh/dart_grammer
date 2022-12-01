```dart
void main() {
  //강의:https://www.inflearn.com/course/dart-언어-입문/unit/107632
   
  //1. Map 활용편
  mapStudy();
   
  //2. Set 활용편
  setStudy();
  
  //3 List에서 Where 활용편
  listWhereStudy();
   
  //4 Reduce, Fold 활용편
  redeceFoidStudy();
   
  //5. cascading operator
  cascadingOperator();
   
  //6. List를 객체로 변환하기
  //   List.객체에서 where절 사용하기
  //   List.객체에서 map,where, fold를 한번에 사용하기
  listToClass();
}
 
//----------------------------------------------------------------------
//1. Map 활용편
//   - key값을 기준으로 중복허용하지 않는다.
//----------------------------------------------------------------------
void mapStudy() {

  Map<String, String> harryPotter = {'Harry':'해리', 'Ron':'론','Hermione':'헤르미온느'};
   
  //1.1. Map.map() : Map을 순환한다. (looping)
  final result = harryPotter.map(
                       (key,value) => MapEntry('$key Potter', '$value 캐릭터'),
                  );
  print(result);
  //{Harry Potter: 해리 캐릭터, Ron Potter: 론 캐릭터, Hermione Potter: 헤르미온느 캐릭터}
   
  //1.2. Map.key : key값을 추출 후 
  final keys1 = harryPotter.keys; //a. Map에서 key만 iterator로 얻기
  final keys2 = harryPotter.keys.map((x)=>'$x Chacrator');  //b. Map에서 key만 map()으로 looping하기
  final keys3 = harryPotter.keys.map((x)=>'$x Chacrator').toList(); //c. Map에서 key만 List로 만들기

  print(keys1); //(Harry, Ron, Hermione)
  print(keys2); //(Harry Chacrator, Ron Chacrator, Hermione Chacrator)
  print(keys3); //[Harry Chacrator, Ron Chacrator, Hermione Chacrator]
   
  //1.3 Map.values : values값을 이용해서 interator, List등으로 얻기 
  //harryPotter.values -> (위 Map.key 문법과 동일)  

  //1.4 Map.entries : Map을 for 로 수행하여 모든 key,value얻기
  //    harryPotter.map()과 동일 방식이지만,  
  //    harryPotter.map()문법이 flutter에서 개발도중 적용이 안되는 경우에 harryPotter.entries를 적용하면 된다.
  for (var element in harryPotter.entries) {
    print('key=${element.key},  value=${element.value}');
  }

  //1.5 Map.from() : Map복사 (harryPotter와 harryCopy는 다른 객체로 인식한다.)
  Map<String, String>  harryCopy = Map.from(harryPotter);
  harryCopy['Farmer'] = '농부';

  //1.6 addAll() : 기존Map에 다른 Map을 추가한다.
  //             : 참고, 반드시 Map<String, String> 이와 같은 type으로 정의 해야 된다.
  //             : var type과 같은 dynamic type으로 정의시 addAll()문법에서 오류가 발생할 수 있다.
  //var twoHarry = {}..addAll(harryPotter)..addAll(harryCopy);
  //harryPotter.addAll({'Farmer':'농부'});
  harryPotter..addAll(harryCopy);


}
 
//----------------------------------------------------------------------
//2 Set활용편
//----------------------------------------------------------------------
void setStudy(){
  Set blackPink = {'로제','지수','제니','리사'};
  //2.1 Set을 다른 Set으로 변환
  final newSet = blackPink.map((x)=>'블랙핑크 $x').toSet();
}
 
//----------------------------------------------------------------------
//3 List에서 Where 활용편
//----------------------------------------------------------------------
void listWhereStudy(){
  List<Map<String, String>> people = [
    {'name':'로제','group':'블랙핑크'}, {'name':'지수','group':'블랙핑크'},
    {'name':'RM','group':'BTS'}, {'name':'뷔','group':'BTS'} ];
  //3.1 where조건절기준으로 true인 List만 얻기
  final bp = people.where((x)=>x['group'] == '블랙핑크');
  final bts = people.where((x)=>x['group'] == 'BTS');
}
 
 
 
//----------------------------------------------------------------------
//4 Reduce, Fold 활용편
//----------------------------------------------------------------------
void redeceFoidStudy(){
  List<int> num = [1,3,5,7,9];
  //4.1 reduce - prev : 맨 처음에는 numbers의 첫번째 값이지만
  //                    두번째부터는 함수에서 return된 값이 됨
  //             next : numbers의 다음값
  final numSum = num.reduce((prev,next){return prev + next;});
   
  //4.2 문자형 결합 (결과:안녕 나는 코드패토리야)
  List<String> words = ['안녕','나는', '코드팩토리이야'];
  final sentence = words.reduce((prev,next)=>prev + next);
   
  //4.3 reduce함수는 return type이 List<String> 이므로 String이여야 한다.
  //    그래서 아래는 오류임
  //words.redue((prev,next)=>prev.length + next.length);
 
  //----------------------------------------------------------------------
  //4.4 fold : reduce는 return type이 이미 정해져 있지만
  //         fold는 개발자가 자유롭게 정의 후 개발할 수 있음
  //        - prev : 맨 처음에는 0 값
  //                   두번째부터는 함수에서 return된 값이 됨
  //        - next : numbers의 첫번째값 부터 순서대로 넘겨짐
  //        - 참고, 그래서 reduce보다 fold 가 수행횟수가 한번더 함
  //----------------------------------------------------------------------
  final sum = num.fold<int>(0, (prev,next){return prev+next;});
   
  final count = words.fold<int>(0,(prev,next)=>prev+next.length);
}
 
 
//5. (...)cascading operator
//   - list안에 값들을 풀어 넣는 역할을 함
void cascadingOperator()
{
  List<int> even = [2,4,6,8];
  List<int> odd  = [1,3,5,7];
  print([even,odd]);        //결과:[[2,4,6,8],[1,3,5,7]] - 리스트안에 2개의 list가 존재
  print([...even,...odd]);  //결과:[2,4,6,8,1,3,5,7] - 리스트안에 값들이 다 풀어짐
  print(even == [...even]); //결과:false - ...은 완전히 새로운 객체로 생성된다.
}
 
//6. List를 객체로 변환하기
void listToClass(){
  final List<Map<String, String>> people = [
    {'name':'지수','group':'블랙핑크'},{'name':'로제','group':'블랙핑크'},
    {'name':'RM','group':'BTS'},{'name':'뷔','group':'BTS'},];
  //!를 해야 되는 이유
  //  - name, group이라는 해당 변수가 List에 존재하는지 알 수 없기 때문에 Dart에서는 오류 발생List<Person>
  //  - !를 추가해서 반드시 존재 한다는 정의를 해줌
  //List형 객체를 얻음 List<Person>
  final parsedPeople = people.map(
    (x)=> Person(name:x['name']!,group:x['group']!)
  );
  print(parsedPeople);
   
  //List.객체에서 where절 사용하기
  final bts = parsedPeople.where(
      (x) => x.group == 'BTS',
  );
   
  //List에서 map,where, fold를 한번에 사용하기
  final result = people.map(
    (x)=> Person(name:x['name']!,group:x['group']!)
  ).where(
      (x) => x.group == 'BTS',
  ).fold<int>(
      0, (prev, next) => prev + next.name.length,
  );
}
class Person{
  final String name;
  final String group;
  Person({required this.name, required this.group});
  @override
  String toString() { return 'Person:$name, group:$group';}
}
```