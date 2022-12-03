# Future 기능으로 서버 호출하기
 - 정의 : Future를 이용해서 날씨정보공공DB에서 자료 조회해 오기
 - 개발프로젝트 : /flutter_module/fine_dust_weather/

# 1. Future
## 1. 기능
 - 여러가지 날씨정보를 불러 온다.
 - Future기능을 사용한다.
 - 날씨 종류 별로 여러번 서버에 호출해서 조회해 온다.
 - final results = await Future.wait(futures);

## 2. 개발소스 1
 - 개발방법 : 날씨 종류별로 서버에 호출하고, 수신하여 사용하는 개발방법 이다.

#### a. 날씨 종류 : 미세먼저, 초미세먼지, 오전,일산화탄소, 이황산가스 
```dart
enum ItemCode { PM10,PM25,CO,NO2,O3,SO2 }
```

 #### b. 날씨 조회 결과 record별 Model
```dart
    class StatModel {
        final double daegu;
        final double chungnam;
        final double incheon;
        final double daejeon;
        final double sejong;
        final double gwangju;
        final double gangwon;
        final DateTime dateTime;
        final ItemCode itemCode;

        //json형태에서부터 데이터를 받아 온다.
        //fromJson
        //  - fromJson은 예약어가 아니고, 개발자가 만든 method이다.
        //    (.fromJson이라는 Named Constructor라는 패턴(?)을 사용한다.)
        //  - 위 member변수목록과 json의 컬럼은 동일해야 된다.
        //    만약, 다르다면 소스코딩 방식이 달라진다.
        //제공된 Package Library를 사용한다면 아래처럼 상세하게 기술할필요가 없이, 몇줄이면 가능하다.
        StatModel.fromJson({required Map<String, dynamic> json})
            : daegu = double.parse(json['daegu'] ?? '0'),
                chungnam = double.parse(json['chungnam'] ?? '0'),
                incheon = double.parse(json['incheon'] ?? '0'),
                daejeon = double.parse(json['daejeon'] ?? '0'),
                sejong = double.parse(json['sejong'] ?? '0'),
                gwangju = double.parse(json['gwangju'] ?? '0'),
                gangwon = double.parse(json['gangwon'] ?? '0'),
                dateTime = DateTime.parse(json['dateTime']),
                itemCode = parseItemCode(json['itemCode']);

        //static으로 정의를 해야 위 constructor에서 사용할 수 있다.
        static ItemCode parseItemCode(String raw) {
            if (raw == 'PM2.5') {
            return ItemCode.PM25;
            }
            return ItemCode.values.firstWhere((element) => element.name == raw);

            //ItemCode.NO2.name; //이 결과는 'NO2' string형으로 return된다.
            //ItemCode.NO2.toString(); //이 결과는 'ItemCode.NO2'과 같이 return된다.
        }
    }
```

#### c. 날씨정보 조회 호출 URL
```dart
class StatRepository {
  static Future<List<StatModel>> fetchData({required ItemCode itemCode}) async {
    var response =
        await Dio().get('http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustFrcstDspth'
      , queryParameters: {
      'serviceKey': 'serviceKey',
      'returnType': 'json',
      'numOfRows': '30',
      'pageNo': '1',
      'itemCode': itemCode.name,
      'dataGubun': 'HOUR',
      'searchDate': '', 
      'searchCondition': 'WEEK'
    });

    return response['response']['body']['items'].map<StatModel>(
          (item) => StatModel.fromJson(json: item),
        )
        .toList();
```
#### d. 날씨 결과 json 예제
     var response = {
       'response': {
         'body': {
           'totalCount': 3,
           'items': [
             {
               'daegu': '0.1',
               'chungnam': '0.2',
               'incheon': '0.3',
               'daejeon': '0.4',
               'sejong': '0.5',
               'gwangju': '0.6',
               'gangwon': '0.7',
               'dateTime': '2022-12-02 14:00',
               'itemCode': 'PM10'
             },
             {
               'daegu': '0.11',
               'chungnam': '0.21',
               'incheon': '0.31',
               'daejeon': '0.41',
               'sejong': '0.51',
               'gwangju': '0.61',
               'gangwon': '0.71',
               'dateTime': '2022-12-02 15:00',
               'itemCode': 'PM10'
             },
             {
               'daegu': '0.12',
               'chungnam': '0.22',
               'incheon': '0.32',
               'daejeon': '0.42',
               'sejong': '0.52',
               'gwangju': '0.62',
               'gangwon': '0.72',
               'dateTime': '2022-12-02 16:00',
               'itemCode': 'PM10'
             }
           ]
         }
       }
     };
#### e. 모든 날씨유형에대해 날씨정보 서버에서 조회
```dart
    class _HomeScreenState extends State<HomeScreen> {
        String region = regions[0];

        //모든 날씨유형에대해 날씨정보 서버에서 조회
        Future<Map<ItemCode, List<StatModel>>> fetchData() async {
            Map<ItemCode, List<StatModel>> stats = {};

            //날씨 유형별로 for
            //  - 유형별로 서버에 각각 접속에서 수신해야 되기 때문에 속도가 많이 느리다.
            //  - 보통은 각 유형별로 서버에서 수신시 await를 한다.
            for (ItemCode itemCode in ItemCode.values) {
              final statModels = await StatRepository.fetchData(itemCode: itemCode);
              stats.addAll({itemCode: statModels});
            }

            return stats;
        }
    }
```
#### f. FutureBuilder를 이용해서 ListView 로 그리기
```dart
    FutureBuilder<Map<ItemCode, List<StatModel>>>(
        future: fetchData(),
        builder: (context, snapshot) {
            ...
            }
    )    
```

## 3. 개발소스 2
 - 유형별로 서버에 각각 접속에서 수신해야 되기 때문에 속도가 많이 느리다.
 - 개발방법 : 날씨 유형별로 for - 속도 개선    
    . 다수의 비동기 요청 병렬로 처리하기    
    . 모든 날씨의 유형을 동시에 호출 후 모든 요청의 응답이 돌아 오면 다음 Logic을 수행하도록 한다.    
 - 위 2. 개발소스 1과 다른 소스는 모두 동일.
 - 다른 부분만 기술한다.
#### 1. 
```dart
    class _HomeScreenState extends State<HomeScreen> {
        String region = regions[0];

        //모든 날씨유형에대해 날씨정보 서버에서 조회
        Future<Map<ItemCode, List<StatModel>>> fetchData() async {
            Map<ItemCode, List<StatModel>> stats = {};

            List<Future> futures = [];

            //날씨 유형별로 for - 속도 개선
            //  - 다수의 비동기 요청 병렬로 처리하기
            //  - 모든 날씨의 유형을 동시에 호출 후 모든 요청의 응답이 돌아 오면 다음 Logic을 수행하도록 한다.
            //  - await가 없기 때문에 서버 호출을 하지만 기다리지 않는다.
            for (ItemCode itemCode in ItemCode.values) {
                futures.add(
                    StatRepository.fetchData(itemCode: itemCode),
                );
            }

            //await Future.wait();
            //  - Future.wait()의 arugment에 Future를 List로 선언(List<Future>) 값을 넣게 되면
            //    List안에 들어가 있는 모든 Future들이 끝날때까지 기다린다.
            //  - 결과값들은 List안에 넣은 순서대로 받게 된다.
            final results = await Future.wait(futures);
            for (int i = 0; i < results.length; i++) {
                final key = ItemCode.values[i];
                final vlaue = results[i];

                stats.addAll({key: vlaue});
            }
            return stats;
        }
    }
```
#### 
#### 
