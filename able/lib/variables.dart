import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoreAboutData extends ChangeNotifier {
  var name = '비에이블투';
  var data = [];
  var ch = 1;
  var page = 0;
  var isClick = [0, 0, 0, 0, 0];

  nameHome() {
    name = '비에이블투';
    notifyListeners();
  }

  nameLogic() {
    name = '논리회로';
    notifyListeners();
  }

  nameElectric() {
    name = '전자회로';
    notifyListeners();
  }

  nameRequest() {
    name = '질문게시판';
    notifyListeners();
  }

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
    isClick[i] = 1;
    notifyListeners();
  }
  resetClick() {
    isClick = [0, 0, 0, 0, 0];
    notifyListeners();
  }
}

class StoreAboutTab extends ChangeNotifier {
  var tab = 0;

  goHome() {
    tab = 0;
    notifyListeners();
  }

  goTest() {
    tab = 1;
    notifyListeners();
  }

  goRequest() {
    tab = 2;
    notifyListeners();
  }
}
