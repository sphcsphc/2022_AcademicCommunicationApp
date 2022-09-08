import 'package:able/main.dart';
import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => StoreAboutData()),
        ChangeNotifierProvider(create: (c) => StoreAboutTab()),
      ],
      child: MaterialApp(
        theme: style.theme,
        home : MyApp()
      )
    )
  );
}

class StoreAboutData extends ChangeNotifier {
  var name = '비에이블투';
  var data = [];
  var ch = 1;
  var page = 0;

  nameHome() {
    name = '비에이블투';
    notifyListeners();
  }

  nameLogic() {
    name = '논리회로';
    notifyListeners();
  }

  nameElectric() {
    name = '전자회로';
    notifyListeners();
  }

  nameRequest() {
    name = '질문게시판';
    notifyListeners();
  }

  getData() async {
    var chData;
    var chData_;
    if (ch == 1) {
      name == '논리회로'
        ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') )
        : chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') );
    }
    if (ch == 2) {
      name == '논리회로'
        ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch02/ch02.json') )
        : chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') );
    }
    if (ch == 3) {
      name == '논리회로'
        ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch03/ch03.json') )
        : chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') );
    }
    if (ch == 4) {
      name == '논리회로'
        ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch04/ch04.json') )
        : chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') );
    }
    chData_ = jsonDecode(chData.body);
    data = chData_;
    page = 0;
    notifyListeners();
  }

  chOne() {
    ch = 1;
    getData();
  }
  chTwo() {
    ch = 2;
    getData();
  }
  chThree() {
    ch = 3;
    getData();
  }
  chFour() {
    ch = 4;
    getData();
  }

  previousPage() {
    page--;
    notifyListeners();
  }
  nextPage() {
    page++;
    notifyListeners();
  }
}

class StoreAboutTab extends ChangeNotifier {
  var tab = 0;

  goHome() {
    tab = 0;
    notifyListeners();
  }

  goTest() {
    tab = 1;
    notifyListeners();
  }

  goRequest() {
    tab = 2;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<StoreAboutData>().name),
        leading: IconButton(icon: Icon(Icons.format_list_bulleted, color: Colors.black, size: 30), 
          onPressed: (){
            Navigator.push(context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => Catalog(),
                transitionsBuilder: (c, a1, a2, child) =>
                  SlideTransition(
                    position: Tween(
                      begin: Offset(-1.0, 0.0),
                      end: Offset(-0.65, 0.0),
                    ).animate(a1),
                    child: child,
                  )
              )
            );
        }),
        actions: [IconButton(icon: Icon(Icons.home_outlined), onPressed: (){
          if (context.read<StoreAboutData>().name != '비에이블투'){
            context.read<StoreAboutData>().nameHome();
            context.read<StoreAboutTab>().goHome();
          }
        })],
      ),
      body: [Home(), Test(), Request()][context.watch<StoreAboutTab>().tab],
    );
  }
}

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('바로가기'),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: (){
                Navigator.pop(context);
              }
          )
        ]
      ),
      body: CatalogBody(),
    );
  }
}

class CatalogBody extends StatelessWidget {
  const CatalogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children : [
        Container(
          width : 350, height : 150,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.fromLTRB(20, 20, 30, 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black12, width: 2)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.power),
                  TextButton(onPressed: (){
                    context.read<StoreAboutData>().nameLogic();
                    context.read<StoreAboutTab>().goTest();
                    showDialog(
                        context: context,
                        builder: (context){ return SetChapter(); }
                    );
                  }, child: Text('논리회로')),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.cable),
                  TextButton(onPressed: (){
                    context.read<StoreAboutData>().nameElectric();
                    context.read<StoreAboutTab>().goTest();
                    showDialog(
                        context: context,
                        builder: (context){ return SetChapter(); }
                    );
                  }, child: Text('전자회로')),
                ],
              ),
            ],
          )
        ),
        Container(
          width : 350, height : 150,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.fromLTRB(20, 20, 30, 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black12, width: 2)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.question_answer),
                  TextButton(onPressed: (){
                    context.read<StoreAboutData>().nameRequest();
                    context.read<StoreAboutTab>().goRequest();
                    Navigator.pop(context);
                  }, child: Text('질문게시판')),
                ],
              )
            ],
          ),
        ),
      ]
    );
  }
}

class SetChapter extends StatelessWidget {
  const SetChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('몇장 볼꺼야?'),
      actions: [
        Center(
          child: Row(
            children: [
              ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().chOne();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MyApp()));
              }, child: Text('1')),
              ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().chTwo();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MyApp()));
              }, child: Text('2')),
              ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().chThree();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MyApp()));
              }, child: Text('3')),
              ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().chFour();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MyApp()));
              }, child: Text('4')),
            ],
          ),
        )
      ],
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    if (context.watch<StoreAboutData>().data.isNotEmpty){
      return Container(
        margin: EdgeInsets.all(30),
        child: ShowProblem()
      );
    } else {
      return Center( child: Text('로딩중') );
    }
  }
}

class ShowProblem extends StatelessWidget {
  const ShowProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['problem'].runtimeType == String
            ? Image.network(context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['problem'])
            : Image.file(context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['problem']),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            context.watch<StoreAboutData>().page == 0
              ? Text('처음')
              : ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().previousPage();
                }, child: Text('이전')),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){ return ShowSolve(); }
              );
            }, child: Text('정답보기')),
            context.watch<StoreAboutData>().page == context.watch<StoreAboutData>().data.length - 1
              ? Text('마지막')
              : ElevatedButton(onPressed: (){
                context.read<StoreAboutData>().nextPage();
                }, child: Text('다음')),
          ],
        )
      ]
    );
  }
}

class ShowSolve extends StatelessWidget {
  const ShowSolve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['solution'].runtimeType == String
        ? Image.network(context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['solution'])
        : Image.file(context.watch<StoreAboutData>().data[context.watch<StoreAboutData>().page]['solution']),
        RawMaterialButton(
          onPressed: (){ Navigator.pop(context); },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(Icons.close, size: 15.0,),
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }
}


class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

