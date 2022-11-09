
/*
 0. Dart기본
    - Dart 에서 모든 변수는 객체이다. 
    - 변수를 선언하면서 초기값을 주지 않으면 null 로 자동 초기화 된다
 1. Null Safety 정의 및 도입이유
    - Null Safety 란 null 에 의한 NPE(Null Pointer Exception)를 runtime 이 아닌 edit-time 에 체크하겠다는 의미이다.
    - 하지만 NPE 는 runtime 에러이며 edit-time 의 에러는 아니다. 즉 컴파일러 체크 대상이 아니라는 이야기이다.
    - 하지만 Null Safety 를 지원하는 언어들은 객체가 null 인 상태에서 발생할수 있는 에러를 edit-time 에 발생시키겠다는 의미이다. 
      즉 컴파일러가 NPE 가 발생할수 있는 가능성을 미리 체크해 NPE 가 발생할수 없는 코드를 작성할 수밖에 없게 하겠다는 의미이다.
    - 컴파일러가 미리 체크만 해준다면 개발자 입장에서 컴파일 에러를 해결하면서 코드를 작성할 수밖에 없고 
      그렇게 되면 작성된 코드는 런타임시 NPE 는 절대 발생하지 않게 된다.
    - 결국 컴파일러 도움을 받아 개발되는 코드가 Null 안전성을 보장한 상태로 개발되게 하고자 하는 개념이다.
 2. Nullable 과 Non-Nullable
    - Null Safety 의 기본은 Nullable 과 Non-Nullable 의 구분이다.
    - Null Safety 가 지원이 되려면 가장 기본적으로 변수 선언시 Nullable 과 Non-Nullable 로 구분되어 선언해 주어야 한다.
    - 이는 컴파일러에게 이 변수에 null 이 대입이 될수 있는지 될수 없는지를 명확하게 알려주자는 개념이고 
      이렇게 컴파일러에게 정보를 주면 컴파일러가 알아서 Non-Nullable 변수에 null 이 대입되는 상황의 에러를 발생시켜 주거나, 
      Nullable 변수를 NPE 를 고려하지 않고 작성하는 상황을 에러를 발생시켜 주게 된다.
    - Dart 언어의 변수는 기본이 Non-Nullable 로 선언되는 것이며 만악 Nullable 로 선언하고자 한다면 타입명 뒤에 ? 를 추가해 주어야 한다.
 3. Nullable
 
 4. Non-Nullable
    - 선언과 동시에 초기값을 주어야 한다.
 5. dynamic 타입에서의 Null Safety
    - dynamic 타입에는 ? 가 추가되어 선언될수 있지만 의미가 없다. 
    - dynamic 타입이 대입되는 값을 한정하지 않겠다는 의미이며 모든 타입의 데이터가 대입될수 있다는 의미이다. 
    - 이 모든 타입에는 Nullable 도 포함이 된다. 그럼으로 dynamic 타입으로 선언되는 것 자체가 Nullable 로 선언되는 것이다.
 6. Local Variable 
    - Local Variable 에서만 Non-Nullable 변수가 선언과 동시에 초기화 되지 않아도 된다.
    - ? 가 추가되지 않아 Non-Nullable 로 선언된 변수는 null 대입이 불가함으로 선언과 동시에 초기값을 주어야 한다. 
    - 하지만 이는 Top-Level 에 선언된 변수와 클래스 멤버 변수의 규칙이며 함수내에 선언되는 Local Variable 은 변수가 
       Non-Nullable 로 선언되었다고 하더라도 선언과 동시에 초기값을 주지 않아도 된다.
 7. casting Test
    - Nullable 과 Non-Nullable 은 타입이다. 그럼으로 타입의 형변형과 관련된 내용도 중요하다.
    - Nullable 로 선언된 변수가 Non-Nullable 로 선언된 변수에 대입이 가능한지, 
      반대로 Non-Nullable 로 선언된 변수가 Nullable 로 선언된 변수에 대입이 가능한지의 문제이다. 
      결론부터 이야기 하면 타입적으로 Nullable 변수는 Non-Nullable 변수의 상위 타입이다. 
      즉 int? 타입이 int 타입의 상위 타입이 된다. 
      그럼으로 Non-Nullable 변수가 Nullable 에 대입되는 것은 스마트 캐스팅에 의해 자동으로 형변형이 된다. 
      하지만 Nullable 변수가 Non-Nullable 에 대입되는 것은 에러이며 하고자 한다면 명시적 캐스팅을 사용해 주어야 한다.
 8. null aware operator - ?. ?[ ] ?..
    - 객체의 값이 null 이 아닌경우 멤버에 접근하며 null 이면 멤버 접근 없이 null 을 값을 발생시키는 연산자들이다.
    - nullable 로 선언된 객체들은 객체의 멤버 접근시 ?. 을 이용해 null safety 하게 코드가 작성되게 강제된다.
    - ?[ ] 은 List 의 데이터를 index 값으로 접근할 때 사용된다. 
      List 객체가 null 이 아니면 index 접근이 되며 null 이면 null 을 반환하는 구문이다.
 9. late keyword
    - non-nullable 로 변수가 선언되면 선언과 동시에 초기값을 주어야 한다. 
      그런데 어떤 경우에는 변수가 non-nullable 로 선언되기는 하지만 선언과 동시에 초기값을 줄수 없는 경우도 있다. 
      즉 변수가 null 인 상태로 이용되지는 않지만 초기값이 앱이 실행되면서 결정되는 경우이다. 
      이때 late keyword 를 사용하면 된다. 
      late 는 단어 뜻 그대로 초기화 시점을 뒤로 미루겠다는 의미이다.
	- 값이 할당 되기전에 해당 변수를 읽으면 오류가 발생한다.
 10. null check하기
    - if else문 사용
    - 삼항연산자 사용
    - ?? 연사자 사용 : 변수가 null이면 ?? 뒤에 값으로 대체한다.	
 11. null assertion 연산자(!)
    - nullable type의 변수를 선언하고 이 변수에 절대로 null이 대입되지 않는다고 100%확신할 수 있는 경우
	  null assertion 연산자(!)를 사용할 수 있다.
 12. required 키워드
    - Non-Nullable타입의 매개변수가 포함된 함수를 선언해야 될 경우에 사용도니다.
	- 

 * 참조 URL : https://kkangsnote.tistory.com/98
*/

main() async{
  String str1=null;  //Non-Nullable 변수 - error
  String? str2=null; //Nullable 변수     - ok  
  
  int  a1=10;  //Non-Nullable 변수
  int? a2=10;  //Nullable 변수
  
  a1=null; //error
  a2=null; //ok
  
  //------------------------------------------------------
  //------------------------------------------------------
  //5. dynamic 타입에서의 Null Safety
  //  var 로 선언하면 타입 추론(type inferred) 변수
  //    - var type에 ? 는 불가
  var a1  = 30;   //ok
  var a2  = null; //ok -> dynamic 추론변수로 처리 된다.
  var? a3 = null; //error
  
  //------------------------------------------------------
  //6. Local Variable 
  //------------------------------------------------------
  testFun() {
    int a1;    //ok
    a1 = null; //error
    
    int? a2;   //ok
    a2 = null; //ok
  }
  
  //------------------------------------------------------
  //7. casting Test
  //------------------------------------------------------
  int  b1=10;
  int? b2=20;
  int? b3;

  b1 = b2 as int; //(값이    존재) 컴파일시 ok, 실행시 ok
  b1 = b3;        //컴파일시 ok
  b1 = b3 as int; //(값이 미 존재) 컴파일시 ok, 실행시 error
  b2 = b1;//ok
  
  //------------------------------------------------------
  //8. null aware operator - ?. ?[ ] ?..
  //------------------------------------------------------
  //1  ?.
  int?  no1=10;
  bool? result1 = no1?.isEven;
  print('result 1 : $result1');  //true
 
  no1=null;
  bool? result2 = no1?.isEven;
  // bool? result2 = no1!.isEven;  --> error
  print('result 2 : $result2');  //null
  
  //2 ?.
  String? str="hello";
  str.isEmpty;   //error...(nullable 로 선언되었음에도 불구하고 str 의 멤버 접근시 ?. 을 사용하지 않아서 발생한 에러)
  str?.isEmpty;  //ok
  
  //3 ?[ ]
  List<int>? list=[10, 20, 30];
  print('list[0] : ${list?[0]}');  //10
  list=null;
  print('list[0] : ${list?[0]}');  //null


  //------------------------------------------------------
  //9. late keyword
  //------------------------------------------------------
  int a1;      //compile error
  late int a2; //ok

  //------------------------------------------------------
  //10. null check하기
  //------------------------------------------------------
  String? str;
  if (str == null) {.. } else { }
  var aa = (str == null ? "empty" : str);
  var bb = (str ?? "empty");

  //------------------------------------------------------
  //11. null assertion 연산자(!)
  //------------------------------------------------------
  int? a = null;
  int c = a;   //compile error
  int d = a!;  //execute error
  
  //------------------------------------------------------
  //12. required 키워드  
  //------------------------------------------------------
  Person p1 = Person(name: "홍길동");

}

class Person
{
	String name;  //생성자에 required가 아니면 error 발생
	int ? birthYear;
	int money;
	
	Person({required this.name, this.birthYear, this.money=0});
}