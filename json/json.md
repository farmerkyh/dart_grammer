# 1. json을 Class Model로 변경 하기
  - 실습프로젝트 : /flutter_module/fine_dust_weather
### 1. json값
```dart
     var weather = {
      'response': {
        'body': {
          'totalCount': 3,
          'items': [{'a': '0.10','b': '0.20'},
		                {'a': '0.12','b': '0.22'},
					          {'a': '0.13','b': '0.23'}] } } };
```

### 2. class Model
```dart
    class StatModel {
      final double a;
      final double b;
      //  - fromJson은 예약어가 아니고, 개발자가 만든 method이다.
      //    (.fromJson이라는 Named Constructor라는 패턴(?)을 사용한다.)
      StatModel.fromJson({required Map<String, dynamic> json})
          : a = double.parse(json['a'] ?? '0'),
            b = double.parse(json['b'] ?? '0');
    }
```

### 3. 실사용  방법
```dart
    weather['response']['body']['items'].map((item) => StatModel.fromJson(json: item));

    또는

    class StatRepository {
      static Future<List<StatModel>> fetchData() async {
        var response =
            await Dio().get('http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustFrcstDspth', queryParameters: {'serviceKey': 'key...','returnType': 'json' });

        return response.data['response']['body']['items'].map<StatModel>(
          (item) => StatModel.fromJson(json: item),
        ).toList();
      }
    }

``