```dart
void main() {
   
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