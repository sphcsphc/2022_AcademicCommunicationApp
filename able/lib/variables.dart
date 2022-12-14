import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreAboutData extends ChangeNotifier {
  var data = [];
  var name = '비에이블투';
  var names = ['비에이블투', '논리회로', '전자회로', '연구실', '동아리'];
  var labName = ['전력시스탬', '전력변환', 'TSD', '로봇틱스', 'N&D'];
  var clubName = ['날개짓', '윙즈'];
  var tab = 0;
  var ch = 1;
  var page = 0;
  var isClick = [0, 0, 0, 0, 0];
  var showSolution = 0;

  getData() async {
    var chData;
    var chData_;
    name == '논리회로'
      ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch0$ch/ch0$ch.json') )
      : chData = await http.get( Uri.parse('https://sphcsphc.github.io/electronic_circuit/ch0$ch/ch0$ch.json') );
    chData_ = jsonDecode(chData.body);
    data = chData_;
    page = 0;
    notifyListeners();
  }

  getIntroduce() async {
    var introData;
    var introData_;
    name == '연구실'
      ? introData = await http.get( Uri.parse('https://sphcsphc.github.io/introduce/lab/lab.json') )
      : introData = await http.get( Uri.parse('https://sphcsphc.github.io/introduce/club/club.json') );
    introData_ = jsonDecode(introData.body);
    data = introData_;
    notifyListeners();
  }

  setName(i) {
    name = names[i];
    notifyListeners();
  }

  setTab(i) {
    tab = i;
    notifyListeners();
  }

  setChapter(c) {
    ch = c;
    notifyListeners();
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

  setClick(i) {
    isClick[i] == 0
      ? isClick[i] = 1
      : isClick[i] = 0;
    notifyListeners();
  }
  resetClick() {
    showSolution = 0;
    isClick = [0, 0, 0, 0, 0];
    notifyListeners();
  }

  isSolveClick() {
    showSolution == 0
      ? showSolution = 1
      : showSolution = 0;
    notifyListeners();
  }
}
