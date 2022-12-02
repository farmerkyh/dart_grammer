void main() {
  //2. Set 활용편
  setStudy();
}

/* set Properties
      blackPink.iterator  
      blackPink.length
      blackPink.first
      blackPink.isEmpty
      blackPink.isNotEmpty
      blackPink.last
      blackPink.single
      blackPink.hashCode
      blackPink.runtimeType
      blackPink.add(value)
      blackPink.addAll(elements)
      blackPink.any((element) => false)

 * set Method
      blackPink.cast()
      blackPink.clear()
      blackPink.contains(value) : value값이 존재 하는 지 여부 return
      blackPink.containsAll(other) : 
      blackPink.difference(other)
      blackPink.elementAt(index)
      blackPink.every((element) => false)
      blackPink.expand((element) => null)
      blackPink.firstWhere((element) => false)
      blackPink.fold(initialValue, (previousValue, element) => null)
      blackPink.followedBy(other)
      blackPink.forEach((element) { })
      blackPink.intersection(other)
      blackPink.join()
      blackPink.lastWhere((element) => false)
      blackPink.lookup(object)
      blackPink.map((e) => null)
      blackPink.reduce((value, element) => null)
      blackPink.remove(value)
      blackPink.removeAll(elements)
      blackPink.removeWhere((element) => false)
      blackPink.retainAll(elements)
      blackPink.retainWhere((element) => false)
      blackPink.singleWhere((element) => false)
      blackPink.skip(count)
      blackPink.skipWhile((value) => false)
      blackPink.toSet()
      blackPink.toString()
      blackPink.union(other)
      blackPink.where((element) => false)
      blackPink.whereType()
      blackPink.noSuchMethod(invocation)
*/

//----------------------------------------------------------------------
//2 Set활용편
//   - 중복허용하지 않는다.
//----------------------------------------------------------------------
void setStudy() {
  Set blackPink = {'로제', '지수'}; //, '제니', '리사'};

  //********************************************************************
  //1. 반복수행관련(loop, 다른Colleciton으로 변환) method
  //********************************************************************
  print('1 ----------------------------------------------------------');
  //1.1 Set.map((e) => null) : Set을 순환한다. (looping)
  //                         : print안함. 이유 모름(???)ㅋㅋㅋ
  //                         : ->느낌이 map()은 return을 하는 method인거 같다.
  blackPink.map((value) => print('1.1 Set.map() : 블랙핑크 $value')); //

  //1.2. Set.forEach((element) { }) : Map을 순환한다. (looping)
  blackPink.forEach((element) {
    print('1.1 Set.forEach() : element=$element');
  });

  //********************************************************************
  //2. 다른 Collection으로 변환 method
  //********************************************************************
  print('2 ----------------------------------------------------------');
  //2.1 Set.map().toSet() : Set을 다른 Set으로 변환
  final newSet = blackPink.map((x) => '블랙핑크 $x').toSet();
  print('2.1 Set.map().toSet() : newSet=$newSet');

  //2.2 Set.map().toList() : Set을 다른 List으로 변환
  final newList = blackPink.map((x) => '블랙핑크 $x').toList();
  print('2.2 Set.map().toList() : newList=$newList');

  // //********************************************************************
  // //1. 반복수행관련 method
  // //********************************************************************
  // print('1 ----------------------------------------------------------');

  // //********************************************************************
  // //2. 검증관련 method
  // //********************************************************************
  // print('2 ----------------------------------------------------------');

  // //********************************************************************
  // //3. 조작(추가,복사)관련 method
  // //********************************************************************
  // print('3 ----------------------------------------------------------');

  // //********************************************************************
  // //4. 조작(수정,삭제 등)관련 method
  // //********************************************************************
  // print('4 ----------------------------------------------------------');

  // //********************************************************************
  // //9. 기타 method
  // //********************************************************************
}
