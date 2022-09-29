import 'package:flutter/material.dart';
import './variables.dart' as variable;
import 'package:provider/provider.dart';

class ShowTestPage extends StatelessWidget {
  const ShowTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<variable.StoreAboutData>().data.isNotEmpty){
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['ProIsText'] == 'True'
          ? Text(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['problem'])
          : Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['problem']),
        ShowDistractor(num: 1),
        ShowDistractor(num: 2),
        ShowDistractor(num: 3),
        ShowDistractor(num: 4),
        ShowProblemBottom()
      ]
    );
  }
}

class ShowDistractor extends StatelessWidget {
  const ShowDistractor({Key? key, this.num}) : super(key: key);
  final num;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          onPressed: (){},
          fillColor: Colors.white,
          child: Text(num.toString()),
          shape: CircleBorder(),
        ),
        context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['ExaIsText'] == 'True'
          ? Text(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page][num.toString()])
          : Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page][num.toString()])
      ],
    );
  }
}

class ShowProblemBottom extends StatelessWidget {
  const ShowProblemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        context.watch<variable.StoreAboutData>().page == 0
          ? Text('처음')
          : ElevatedButton(onPressed: (){
            context.read<variable.StoreAboutData>().previousPage();
          }, child: Text('이전')),
        ElevatedButton(onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return ShowSolve();
            }
          );
        }, child: Text('정답보기')),
        context.watch<variable.StoreAboutData>().page == context.watch<variable.StoreAboutData>().data.length - 1
          ? Text('마지막')
          : ElevatedButton(onPressed: (){
            context.read<variable.StoreAboutData>().nextPage();
          }, child: Text('다음')),
      ],
    );
  }
}

class ShowSolve extends StatelessWidget {
  const ShowSolve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['solution'].runtimeType == String
              ? Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['solution'])
              : Image.file(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['solution']),
            RawMaterialButton(
              onPressed: (){ Navigator.pop(context); },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(Icons.close, size: 15.0),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ],
        )
      ],
    );
  }
}
