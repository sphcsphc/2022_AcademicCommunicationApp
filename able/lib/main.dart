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
            icon: Icon(Icons.format_list_bulleted, color: Colors.black, size: 30), 
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
          [Container(), test.ShowTestPage(), intro.ShowIntroPage()][context.watch<variable.StoreAboutData>().tab]
        ]
      )
    );
  }
}
