import 'package:flutter/material.dart';
import './main.dart' as main;
import './variables.dart' as variable;
import 'package:provider/provider.dart';

class ShowCatalog extends StatelessWidget {
  const ShowCatalog({Key? key}) : super(key: key);

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
        body: ListView(
          children: const [
            ShowCatalogBody()
          ]
        )
    );
  }
}

class ShowCatalogBody extends StatelessWidget {
  const ShowCatalogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  TextButton(
                    onPressed: (){
                      context.read<variable.StoreAboutData>().nameLogic();
                      context.read<variable.StoreAboutTab>().goTest();
                      showDialog(
                        context: context,
                        builder: (context){ return SetLogicChapter(); }
                      );
                    }, 
                    child: Text('논리회로')
                  )
                ]
              ),
              Row(
                children: [
                  Icon(Icons.cable),
                  TextButton(
                    onPressed: (){
                      context.read<variable.StoreAboutData>().nameElectric();
                      context.read<variable.StoreAboutTab>().goTest();
                      showDialog(
                        context: context,
                        builder: (context){ return SetElectricChapter(); }
                      );
                    }, 
                    child: Text('전자회로')
                  )
                ]
              )
            ]
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
                  TextButton(
                    onPressed: (){
                      context.read<variable.StoreAboutData>().nameRequest();
                      context.read<variable.StoreAboutTab>().goRequest();
                      Navigator.pop(context);
                    }, 
                    child: Text('질문게시판')
                  )
                ]
              )
            ]
          )
        )
      ]
    );
  }
}

class SetLogicChapter extends StatelessWidget {
  const SetLogicChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('몇장 볼꺼야?'),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chOne();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('1')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chTwo();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('2')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chThree();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('3')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chFour();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('4')
              )
            ]
          )
        )
      ]
    );
  }
}

class SetElectricChapter extends StatelessWidget {
  const SetElectricChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('몇장 볼꺼야?'),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chOne();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('1')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chTwo();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('3')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chThree();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('4')
              ),
              ElevatedButton(
                onPressed: (){
                  context.read<variable.StoreAboutData>().resetClick();
                  context.read<variable.StoreAboutData>().chFour();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => main.MyApp()
                    )
                  );
                },
                child: Text('5')
              )
            ]
          )
        )
      ]
    );
  }
}
