import 'package:flutter/material.dart';
import './variables.dart' as variable;
import 'package:provider/provider.dart';

class ShowIntroPage extends StatelessWidget {
  const ShowIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<variable.StoreAboutData>().data.isNotEmpty) {
      return context.read<variable.StoreAboutData>().name == '연구실'
        ? ShowLabs()
        : ShowClubs();
    } else {
      return Text('로딩중');
    }
  }
}

class ShowLabs extends StatelessWidget {
  const ShowLabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ShowName(num: 0, tab: 0),
              ShowName(num: 1, tab: 0)
            ]
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ShowName(num: 2, tab: 0),
              ShowName(num: 3, tab: 0),
              ShowName(num: 4, tab: 0)
            ]
          )
        ]
      )
    );
  }
}

class ShowClubs extends StatelessWidget {
  const ShowClubs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ShowName(num: 0, tab: 1),
              ShowName(num: 1, tab: 1)
            ]
          )
        ]
      )
    );
  }
}


class ShowName extends StatelessWidget {
  const ShowName({Key? key, this.num, this.tab}) : super(key: key);
  final num;
  final tab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: tab == 0
        ? Text(context.read<variable.StoreAboutData>().labName[num], style: TextStyle(fontSize: 20))
        : Text(context.read<variable.StoreAboutData>().clubName[num], style: TextStyle(fontSize: 20)),
      onTap: (){
        Navigator.push(context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => ShowScaffold(num: num, tab: tab),
            transitionsBuilder: (c, a1, a2, child) => FadeTransition(opacity: a1, child: child),
            transitionDuration: Duration(milliseconds: 500)
          )
        );
      }
    );
  }
}

class ShowScaffold extends StatelessWidget {
  const ShowScaffold({Key? key, this.num, this.tab}) : super(key: key);
  final num;
  final tab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tab == 0
          ? Text(context.read<variable.StoreAboutData>().labName[num])
          : Text(context.read<variable.StoreAboutData>().clubName[num]),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          }
        )
      ),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(30),
          child: ShowBody(num: num, tab: tab)
        )
      ])
    );
  }
}

class ShowBody extends StatelessWidget {
  const ShowBody({Key? key, this.num, this.tab}) : super(key: key);
  final num;
  final tab;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 120,
              height: 80,
              child: tab == 0
                ? Text("지도교수님")
                : Text("동아리 회장")
            ),
            SizedBox(
              height: 80,
              child: Text(context.read<variable.StoreAboutData>().data[num]['name'] ?? '로딩중')
            )
          ]
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
              height: 80,
              child: tab == 0
                ? Text("관련 전공과목")
                : Text("동아리 소개")
            ),
            Expanded(
              child: SizedBox(
                height: 80,
                child: ListView(
                  children: [Text(context.read<variable.StoreAboutData>().data[num]['info'] ?? '로딩중')]
                )
              )
            )
          ]
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 120,
              height: 100,
              child: tab == 0
                ? Text("연구분야")
                : Text("활동 내용")
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: ShowStudy(num: num, ind: context.read<variable.StoreAboutData>().data[num]['study'].length)
              )
            )
          ]
        ),
        SizedBox(height: 10),
        Center(
          child: context.read<variable.StoreAboutData>().data[num]['picture'] != 'empty'
            ? Image.network(context.read<variable.StoreAboutData>().data[num]['picture'])
            : SizedBox()
        )
      ]
    );
  }
}

class ShowStudy extends StatelessWidget {
  const ShowStudy({Key? key, this.num, this.ind}) : super(key: key);
  final num;
  final ind;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ind,
      itemBuilder: (context, i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.read<variable.StoreAboutData>().data[num]['study'][i] ?? '로딩중'),
            SizedBox(height: 10)
          ]
        );
      }
    );
  }
}
