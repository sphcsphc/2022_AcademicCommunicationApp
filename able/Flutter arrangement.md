# 위젯

## 기본 위젯

### - 글을 출력하는 Text()

- #### 글자에 스타일 넣는 style: TextStyle()

  - ##### 색 주는 법

    1. Colors.칼라명

    2. Color.fromRGBO(20,130,50,0.8)

    3. Color(0xffaaaaaa)

       왼쪽에 색상을 지정해줄 수 있는 박스가 생긴다.

       

  - ##### 또 다른 스타일

    backgroundColor: 색상

    fontSize: 30

    fontWeight: FontWeight.w700

    fontFamily: '폰트종류' 

    letterSpacing: 3

```dart
Text('내용',
    style : TextStyle( color : Color(0xffaaaaaa) )
)
```



### - 글을 입력하는 TextField()

```dart
TextField(
    # 방법 1
    controller: inputData_controller,
    
    # 방법 2
    onChanged: (text){ inputData_onChange = text; },
),
```



### - 아이콘을 넣을 수 있는 Icon()

아이콘 이름은 https://api.flutter.dev/flutter/material/Icons-class.html 여기서 직접 찾으면 됩니다. 

- #### 아이콘에 스타일 넣는 법

  - ##### color: 색상

    TextStyle()과 동일

  - ##### size: 상수

```dart
Icon(Icons.아이콘 이름, color: Color(0xffaaaaaa), size: 20)
```



### - 사진을 넣을 수 있는 Image()

우선, 프로젝트 내에 assets 폴더 만들고 이미지 파일을 거기 넣어둡니다.

```dart
Image.asset('파일명.파일형식', width: 상수)
```



### - 박스 위젯

- #### 박스를 넣고 싶으면 Container()

  - ##### 박스에 여백을 주는 파라미터

    - ###### margin: 바깥 여백 양

    - ###### padding: 안쪽 여백 양

    EdgeInsets.all() : 상하좌우 여백

    EdgeInsets.fromLTRB(10, 20, 30, 40) : 왼쪽 10, 위 20, 오른쪽 30, 밑 40 만큼 여백

    

  - ##### 스타일 주는 파라미터

    - ###### decoration: BoxDecoration()

       BoxDecoration() 안에 넣을 수 있는 것들은 border, color, shape, boxShadow, gradient, image, borderRadius 등이 있다.

      

- #### width, height 이런 파라미터만 필요하면 SizedBox()

  Container() 보다 훨씬 가볍다.

```dart
Container( 
  width : 50, height : 50, color: Colors.blue,
  margin: EdgeInsets.all(30), 
  padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
  decoration : BoxDecoration(
    border : Border.all(color: Colors.black)
  ),
  child: 박스에 넣을 위젯
)
```



- #### 박스의 폭을 %로 주고 싶다면 Flexible()

  flex는 이 박스가 얼마나 가로폭을 차지할지 결정하는 "배수"입니다.

  1과 2를 써놓으면 1대 2만큼 차지합니다.

  1과 1을 써놓으면 1대 1만큼 차지합니다.

```dart
Row(
  children : [
    Flexible( child: Container(color : Colors.blue), flex : 1 ),
    Flexible( child: Container(Color : Colors.green), flex : 2 )
  ]
)
```



- #### 하나의 박스만 가로폭을 꽉 채우고 싶으면 Expanded()

```dart
Row(
  children : [
    Expanded( child: Container(color : Colors.blue), flex : 1 ),
    Container(Color : Colors.green, width : 100),
    Container(Color : Colors.red, width : 100),
  ]
)
```



## 레이아웃 위젯

### - 머리가슴배로 나눠주는 Scaffold()

- #### 상단바 appBar: AppBar()

  - ##### title: 제목

  - ##### leading: 제목왼쪽 아이콘

  - ##### actions: 제목오른쪽 아이콘들

  - ##### flexibleSpace

  - ##### bottom

- #### 필수인 body

- #### 하단바 bottomNavigationBar: BottomAppBar()

```dart
Scaffold(
    appBar: 상단에 넣을 위젯,
    body: 중단에 넣을 위젯,
    bottomNavigationBar: 하단에 넣을 위젯
)
Scaffold(
    appBar: AppBar(
  	  title : Text('앱제목'),
  	  leading : Icon(Icons.star),
  	  actions : [ Icon(Icons.star), Icon(Icons.star) ]
	), 
    body: Text('안녕'), 
    bottomNavigationBar: BottomAppBar( child: Text('하단바임 ㅅㄱ') ),
)
```



## 버튼 위젯

- #### TextButton()

- #### IconButton()

- #### ElevatedButton()

- #### RaisedButton()

외모만 다를 뿐이니 3개 중 골르면 된다.

```dart
TextButton( child: Text('버튼임'), onPressed: (){} )
IconButton( icon: Icon(), onPressed: (){} )
ElevatedButton( child: Text('버튼임'), onPressed: (){} )
RaisedButton( child: Text('버튼임'), onPressed: (){} )
```

- #### FloatingActionButton()

  하단에 공중에 뜬 버튼을 만들 수 있다.

```dart
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  var a = 1;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home : Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            onPressed: (){
              setState(() {
                a++;
              });
            },
          )
      )
    );

  }
} 
```





## 정렬 위젯

### - 자식 위젯의 위치를 지정해주는 위젯

- #### 중앙정렬 Center()

```dart
Center( 
    child: 정렬할 위젯
)
```

- #### 좌, 우 등 다양한 정렬 Align()

```dart
Align(
  alignment : Alignment.정렬방법,
  child : 정렬할 위젯
)
```



### - 가로/세로로 쪼개주는 위젯

- #### 가로로 쪼개주는 Row()

- #### 세로로 쪼개주는 Column()

- ##### 배치되는 간격을 조절해주는 파라미터

  - ###### MainAxisAlignment

    .spaceEvenly 는 모든 여백 동일

    .spaceBetween 은 좌우 끝에 우선 배치

    .spaceAround는 모든 여백 동일인데 좌우 마지막 여백은 절반만큼

    .start는 시작 부분에 다 모여

    .end는 끝 부분에 다 모여

    .center는 중간에 다 모여 

    

  - ###### CrossAxisAlignment

    .start는 시작 부분에 다 모여

    .end는 끝 부분에 다 모여

    .center는 중간에 다 모여 

    

  Row() 쓰면 mainAxis가 가로가 되고 crossAxis가 세로가 된다.

  Column() 쓰면 mainAxis가 세로가 되고 crossAxis가 가로가 됩니다.

```dart
Row( 
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ 
      Icon(Icons.star), 
      Icon(Icons.star), 
      Icon(Icons.star),
  ],
), 
```



- #### 목록을 만들어주는 ListView()

  Column() 이거랑 유사하게 쓰고 데이터 양이 많으면 스크롤이 생긴다.

  - ##### appBar와 비슷한 ListTile()

  - ##### 목록을 동적으로 많이 만들 경우 .builder()

    itemCount: 리스트갯수

    itemBuilder: (){ return 반복할위젯 }

```dart
ListView(
  children: [
    Text('안녕'),
    Text('안녕'),
    Text('안녕'),
  ],
) 

ListView(
  children: [
	ListTile(
  	  leading : Icon(Icons.person),
  	  title : Text('홍길동'),
      trailing: TextButton( child: Text('버튼임'), onPressed: (){} )
    ),
  ],
)
    
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, i) {
    return Text('안녕');
  }
);  
```



## 커스텀 위젯

##### python 에 함수 같은 역할

```dart
class 작명하셈 extends StatelessWidget {
  const 작명하셈({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return 짧은단어로축약할위젯()

  }
} 
```



## Dialog()

### Dialog가 하나가 뿅 showDialog()

```dart
showDialog(
  context: context, 
  builder: (context){
  return Dialog(
    child: Container(
      width: 300,
      height: 300,
      child: Column(
        children: [
          TextField(),
          TextButton( child: Text('완료'), onPressed:(){} ),
          TextButton(
            child: Text('취소'),
            onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  },
);
```



### Dialog를 닫고 싶다면 Navigator.pop(context);

```dart
class DialogUI extends StatelessWidget {
  DialogUI({Key? key}) : super(key: key);
  var inputData_controller = TextEditingController();
  var inputData_onChange = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField( controller: inputData_controller, ),
            TextField( onChanged: (text){ inputData_onChange = text; },),
            TextButton( child: Text('완료'), onPressed:(){} ),
            TextButton(
              child: Text('취소'),
              onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  }
}
```



# 문법

## state의 모든 것

- ### State 선언

  - #### StatefulWidget 만들기

    - ##### stful 이라고 입력하고 탭이나 엔터

    - ##### 기존 StatelessWidget에 클릭 후 왼쪽 전구에서 *Convert to StatefulWidget* 클릭

  ```dart
  class 테스트 extends StatefulWidget {
    const 테스트({Key? key}) : super(key: key);
    @override
    _테스트State createState() => _테스트State();
  }
  
  class _테스트State extends State {
  
    var 변수 = 값;  //여기 만드는 변수는 state가 된다 
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }  
  ```

  

- ### 변수를 다루는 법

  1. ##### const 제거

  2. ##### 변수 선언

  3. ##### setState(() {}) 함수 사용

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home : MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['김성현', '김호준', '이호준'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text('연락처'),),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text(like[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                child: Text('좋아요'),
                onPressed: (){
                  setState(() {
                    like[i]++;
                  });
                },
              ),
            );
          }
      ),
    );

  }
}
```



- ### 부모 -> 자식 state 전송하는 법

1. #### 보내기 

   ##### 자식쓰는 곳에다가 파라미터로 넣으면 보내기 끝

   ```dart
   (MyApp 안의 DialogUI() 쓰던 곳)
   DialogUI( state : a ) 
   ```

   

2. #### 자식에서 state 이름을 등록

   ##### 자식 위젯 정의부분에서 어떤 파라미터가 들어올 수 있다고 등록

   ```dart
   class DialogUI extends StatelessWidget {
     DialogUI({Key? key, this.state }) : super(key: key);
     final state;
   ```

   - ###### final이란 val처럼 변수를 선언하지만 수정이 불가능하다(Read Only)

   - ###### DialogUI(a, b)이런 식으로 class 파라미터 정의할 수 있지만

     ###### DialogUI({Key? key, this.state })처럼 중괄호를 붙히면 선택적 파라미터가 된다

   

3. #### 자식에서 사용

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          home : MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['김성현', '김호준', '이호준'];
  var like = [0, 0, 0];

  addOne() {
    setState(() {
      total++;
    }); }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar( title: Text(total.toString()) ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text(like[i].toString()),
              title: Text(name[i] ?? '이름없음'),
              trailing: ElevatedButton(
                child: Text('좋아요'),
                onPressed: (){
                  setState(() {
                    like[i]++;
                  });
                },
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return DialogUI( addOne : addOne );
          });
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addOne }) : super(key: key);
  final addOne;
  var inputData_controller = TextEditingController();
  var inputData_onChange = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(),
            TextButton( child: Text('완료'), onPressed:(){
              addOne();
              Navigator.pop(context);
            } ),
            TextButton(
                child: Text('취소'),
                onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  }
}

```

