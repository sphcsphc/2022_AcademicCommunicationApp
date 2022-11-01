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
      return Text('로딩중');
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
        Text("Q${context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['num'].toString() ?? 0}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: Text( context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['problem'] ?? '로딩중')
            )
          ]
        ),
        Center(
          child:
            context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['ProHasImg'] == 'True'
              ? Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['picture'])
              : SizeBox()
        ),
        ShowDistractor(num: 1),
        ShowDistractor(num: 2),
        context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['3'] == 'False'
          ? SizeBox()
          : ShowDistractor(num: 3),
        context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['4'] == 'False'
          ? SizeBox()
          : ShowDistractor(num: 4),
        ShowProblemBottom(),
        SizedBox(height: 20),
        context.read<variable.StoreAboutData>().showSolution == 0
          ? SizedBox()
          : Center( child: ShowSolve() )
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RawMaterialButton(
          onPressed: (){
            context.read<variable.StoreAboutData>().setClick(num);
          },
          constraints: BoxConstraints(maxHeight: 50, maxWidth: 50, minHeight: 20, minWidth: 20),
          fillColor: 
            context.watch<variable.StoreAboutData>().isClick[num] == 0
              ? Colors.white
              : context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['answer'] == num
                ? Colors.lightGreen
                : Colors.pinkAccent,
          child: 
            context.watch<variable.StoreAboutData>().isClick[num] == 0
              ? Text(num.toString())
              : context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['answer'] == num
                ? Text('O')
                : Text('X'),
          shape: CircleBorder(),
        ),
        Expanded(
          child: Text( context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page][num.toString()] ?? '로딩중')
        )
      ]
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
          : ElevatedButton(
              onPressed: (){
                context.read<variable.StoreAboutData>().resetClick();
                context.read<variable.StoreAboutData>().previousPage();
              }, 
              child: Text('이전')
            ),
        ElevatedButton(
          onPressed: (){
            context.read<variable.StoreAboutData>().isSolveClick();
          },
          child: context.read<variable.StoreAboutData>().showSolution == 0
            ? Text('정답보기')
            : Text('정답숨김')
        ),
        context.watch<variable.StoreAboutData>().page == context.watch<variable.StoreAboutData>().data.length - 1
          ? Text('마지막')
          : ElevatedButton(
              onPressed: (){
                context.read<variable.StoreAboutData>().resetClick();
                context.read<variable.StoreAboutData>().nextPage();
              }, 
              child: Text('다음') 
            )
      ]
    );
  }
}

class ShowSolve extends StatelessWidget {
  const ShowSolve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['solution']),
      onTap: (){
        Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => ShowSolveCloser(),
            transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
            transitionDuration: Duration(milliseconds: 500)
          )
        );
      }
    );
  }
}

class ShowSolveCloser extends StatelessWidget {
  const ShowSolveCloser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(context.watch<variable.StoreAboutData>().data[context.watch<variable.StoreAboutData>().page]['solution']),
      onTap: (){
        Navigator.pop(context);
      }
    );
  }
}
