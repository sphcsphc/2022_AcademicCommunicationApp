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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          }
        )
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
          width : 250, height : 150,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
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
                      context.read<variable.StoreAboutData>().setName(1);
                      context.read<variable.StoreAboutTab>().setTab(1);
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
                      context.read<variable.StoreAboutData>().setName(2);
                      context.read<variable.StoreAboutTab>().setTab(1);
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
          width : 250, height : 150,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black12, width: 2)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.engineering),
                  TextButton(
                    onPressed: (){
                      context.read<variable.StoreAboutData>().setName(3);
                      context.read<variable.StoreAboutData>().setTab(2);
                      context.read<variable.StoreAboutData>().getIntroduce();
                      Navigator.pop(context);
                    }, 
                    child: Text('연구실 소개')
                  )
                ]
              ),
              Row(
                children: [
                  Icon(Icons.groups),
                  TextButton(
                    onPressed: (){
                      context.read<variable.StoreAboutData>().setName(4);
                      context.read<variable.StoreAboutData>().setTab(2);
                      context.read<variable.StoreAboutData>().getIntroduce();
                      Navigator.pop(context);
                    },
                    child: Text('동아리 소개')
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
