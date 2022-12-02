void main() {
  listWhereStudy();
}

/* List.속성
    alphabets.length
    alphabets.reversed
    alphabets.hashCode
    alphabets.runtimeType
    alphabets.first
    alphabets.isEmpty
    alphabets.isNotEmpty
    alphabets.iterator
    alphabets.last
    alphabets.single
  * ListObject.method
    alphabets.add(value)
    alphabets.addAll(iterable)
    alphabets.any((element) => false)
    alphabets.asMap()
    alphabets.cast()
    alphabets.clear()
    alphabets.contains(element)
    alphabets.elementAt(index)
    alphabets.every((element) => false)
    alphabets.expand((element) => null)
    alphabets.fillRange(start, end)
    alphabets.firstWhere((element) => false)
    alphabets.fold(initialValue, (previousValue, element) => null)
    alphabets.followedBy(other)
    alphabets.forEach((element) { })
    alphabets.getRange(start, end)
    alphabets.indexOf(element)
    alphabets.indexWhere((element) => false)
    alphabets.insert(index, element)
    alphabets.insertAll(index, iterable)
    alphabets.lastIndexOf(element)
    alphabets.lastIndexWhere((element) => false)
    alphabets.lastWhere((element) => false)
    alphabets.map((e) => null)
    alphabets.reduce((value, element) => null)
    alphabets.remove(value)
    alphabets.removeAt(index)
    alphabets.removeLast()
    alphabets.removeRange(start, end)
    alphabets.removeWhere((element) => false)
    alphabets.replaceRange(start, end, replacements)
    alphabets.retainWhere((element) => false)
    alphabets.setAll(index, iterable)
    alphabets.setRange(start, end, iterable)
    alphabets.shuffle()
    alphabets.singleWhere((element) => false)
    alphabets.skip(count)
    alphabets.skipWhile((value) => false)
    alphabets.sort()
    alphabets.sublist(start)
    alphabets.take(count)
    alphabets.takeWhile((value) => false)
    alphabets.toList()
    alphabets.toSet()
    alphabets.toString()
    alphabets.where((element) => false)
    alphabets.whereType()
    alphabets.noSuchMethod(invocation)

  * List.method
    List.castFrom(source)
    List.copyRange(target, at, source)
    List.empty()
    List.filled(length, fill)
    List.from(elements)
    List.generate(length, (index) => null)
    List.of(elements)
    List.unmodifiable(elements)
    List.writeIterable(target, at, source)
*/

//----------------------------------------------------------------------
//3 List에서 Where 활용편
//----------------------------------------------------------------------
void listWhereStudy() {
  List alphabets = ['a', 'b', 'c', 'd', 'e'];

  List<Map<String, String>> people = [
    {'name': '로제', 'group': '블랙핑크'},
    {'name': '지수', 'group': '블랙핑크'},
    {'name': 'RM', 'group': 'BTS'},
    {'name': '뷔', 'group': 'BTS'}
  ];
  //3.1 where조건절기준으로 true인 List만 얻기
  final blackPink = people.where((x) => x['group'] == '블랙핑크');
  final bts = people.where((x) => x['group'] == 'BTS');

  //********************************************************************
  //1. 반복수행관련(loop, 다른Colleciton으로 변환) method
  //********************************************************************
  print('1 ----------------------------------------------------------');

  //********************************************************************
  //2. 검증관련 method
  //********************************************************************
  print('2 ----------------------------------------------------------');

  //********************************************************************
  //3. 조작(추가,복사)관련 method
  //********************************************************************
  print('3 ----------------------------------------------------------');

  //********************************************************************
  //4. 조작(수정,삭제 등)관련 method
  //********************************************************************
  print('4 ----------------------------------------------------------');

  //********************************************************************
  //9. 기타 method
  //********************************************************************
  print('9 ----------------------------------------------------------');
}
