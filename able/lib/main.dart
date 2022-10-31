import 'package:able/main.dart';
import 'package:flutter/material.dart';
import './catalogPage.dart' as catalog;
import './testPage.dart' as test;
import './introducePage.dart' as intro;
import './variables.dart' as variable;
import './styles.dart' as style;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => variable.StoreAboutData())
      ],
      child: MaterialApp(
        theme: style.theme,
        home : MyApp()
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<variable.StoreAboutData>().name),
        leading: 
          IconButton(
            icon: Icon(Icons.format_list_bulleted), 
            onPressed: (){
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (c, a1, a2) => catalog.ShowCatalog(),
                transitionsBuilder: (c, a1, a2, child) => SlideTransition(
                  position: 
                    Tween(
                      begin: Offset(-1.0, 0.0),
                      end: Offset(0.0, 0.0)
                    ).animate(a1),
                  child: child
                )
              ));
            }
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.home_outlined), 
            onPressed: (){
              if (context.read<variable.StoreAboutData>().name != '비에이블투'){
                context.read<variable.StoreAboutData>().setName(0);
                context.read<variable.StoreAboutTab>().setTab(0);
              }
            }
          )
        ]
      ),
      body: ListView(
        children: [
          [Home(), test.ShowTestPage(), intro.ShowIntroPage()][context.watch<variable.StoreAboutData>().tab]
        ]
      )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('전자정보공학과  ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('Electronic Information Engineering'),
          SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: Text('현재와 미래의 정보화, 세계화 사회를 이끄는 중추적 기술의 하나인 IT(Information Technology) 기술은 컴퓨터와 전기, 전자, 제어공학 및 정보통신 기술이 융합된 복합기술입니다. 전자정보공학과는 이렇게 융합된 복합기술과 그 세부 기술들을 종합적으로 교육하여, 국내 산업 현장에서 꼭 필요한 인재의 양성을 그 목표로 하고 있습니다.')
              )
            ]
          ),
          SizedBox(height: 20),
          Text('Q. 전자정보공학과는 무엇을 배우나요?', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('- 디스플레이 전자정보 트랙'),
          Row(
            children: const [
              Expanded(
                child: Text('우리나라가 세계 최고의 기술력을 확보하고 있는 디스플레이 및 반도체산업분야에 대한 교육')
              )
            ]
          ),
          SizedBox(height: 10),
          Text('- 전력 정보 시스템 트랙'),
          Row(
            children: const [
              Expanded(
                child: Text('모든 산업의 근간이 되는 전력시스템 및 전력전자 산업분야에 대한 교육')
              )
            ]
          ),
          SizedBox(height: 10),
          Text('- 제어 정보 시스템 트랙'),
          Row(
            children: const [
              Expanded(
                child: Text('차세대 국가 성장 동력 산업으로 추진되고 있는 지능로봇 및 디지털전자 산업분야에 대한 교육')
              )
            ]
          ),
          SizedBox(height: 20),
          Text('Q. 전자정보공학과 취업률은 어떻게 되나요?', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('2021년 기준으로 취업률은 73.3프로입니다.')
        ]
      )
    );
  }
}
