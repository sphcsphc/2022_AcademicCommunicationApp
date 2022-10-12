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
                        builder: (context){ return SetChapter(); }
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
                        builder: (context){ return SetChapter(); }
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

class SetChapter extends StatelessWidget {
  const SetChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('몇장 볼꺼야?'),
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ImplementButton(num: 1),
                ImplementButton(num: 2),
                ImplementButton(num: 3),
                ImplementButton(num: 4)
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ImplementButton(num: 5),
                ImplementButton(num: 6),
                ImplementInvisible(),
                ImplementInvisible()
              ]
            )
          ]
        )
      ]
    );
  }
}

class ImplementButton extends StatelessWidget {
  const ImplementButton({Key? key, this.num}) : super(key: key);
  final num;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        context.read<variable.StoreAboutData>().resetClick();
        num == 1
          ? context.read<variable.StoreAboutData>().setChapter(num)
          : context.read<variable.StoreAboutData>().name == '논리회로'
            ? context.read<variable.StoreAboutData>().setChapter(num)
            : context.read<variable.StoreAboutData>().setChapter(num + 1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => main.MyApp()
          )
        );
      },
      child:
        num == 1
          ? Text(num.toString())
          : context.read<variable.StoreAboutData>().name == '논리회로'
            ? Text(num.toString())
            : Text((num + 1).toString())
    );
  }
}

class ImplementInvisible extends StatelessWidget {
  const ImplementInvisible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      child: null
    );
  }
}
