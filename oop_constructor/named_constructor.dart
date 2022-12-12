//https://dart.dev/guides/language/language-tour#classes
const double xOrigin = 0;
const double yOrigin = 0;

//Named constructor
// - 명명된 생성자는 child에게 상속하지 안는다.
//():
// - Initializer List
// - Initializer List는 생성자 옆에 콜론(:) 으로 시작하여 콤마(,)로 구분한다.
// - Initializer List목록중 '=' 우측에는 instance변수가 올 수 없다.
//기본 constructor
// - 기본생성자가 없는 클래스를 상속받았을 경우 하위클래스  생성자는 에러가 발생한다.
// - 이유는 하위 클래스는 생성자의 본문을 실행하기 전에 상위 클래스이 기본생성자를 호출하기 때문이다.
// - 이때 상위 클래스의 다른 생성자를 호출하여야 하는데, 이를 처리할 수 있는 방법이 Initializer List를 이용하면 된다.
//실행순서
//  1. 이니셜라이져 리스트 (Initializer list)
//  2. 슈퍼클래스의 매개변수 없는 생성자
//  3. 서브클래스의 매개변수 없는 생성자

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  Point.orgin()
      : x = xOrigin,
        y = yOrigin;

  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson() : ($x, $y)');
  }
}

class SubPoint extends Point {
  SubPoint.fromJson(Map<String, double> data) : super.fromJson(data) {
    print('SubPoint class');
  }
}

void main() {
  var sub = SubPoint.fromJson({'x': 30.0, 'y': 20.3});
  print(sub);
}

/* 출력결과

In Point.fromJson() : (30, 20.3)
SubPoint class
Instance of 'SubPoint'
*/