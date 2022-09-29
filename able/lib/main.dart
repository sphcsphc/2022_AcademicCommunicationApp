import 'package:able/main.dart';
import 'package:flutter/material.dart';
import './styles.dart' as style;
import './variables.dart' as variable;
import './catalogPage.dart' as catalog;
import './testPage.dart' as test;
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      body: ListView(
        children: [
          [Home(), Test(), Request()][context.watch<StoreAboutTab>().tab],
        ],
      )
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

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
