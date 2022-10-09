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
    if (ch == 1) {
      name == '논리회로'
          ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch01/ch01.json') )
          : chData = await http.get( Uri.parse('https://sphcsphc.github.io/electronic_circuit/ch01/ch01.json') );
    }
    if (ch == 2) {
      name == '논리회로'
          ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch02/ch02.json') )
          : chData = await http.get( Uri.parse('https://sphcsphc.github.io/electronic_circuit/ch03/ch03.json') );
    }
    if (ch == 3) {
      name == '논리회로'
          ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch03/ch03.json') )
          : chData = await http.get( Uri.parse('https://sphcsphc.github.io/electronic_circuit/ch04/ch04.json') );
    }
    if (ch == 4) {
      name == '논리회로'
          ? chData = await http.get( Uri.parse('https://sphcsphc.github.io/logic_circuit/ch04/ch04.json') )
          : chData = await http.get( Uri.parse('https://sphcsphc.github.io/electronic_circuit/ch05/ch05.json') );
    }
    chData_ = jsonDecode(chData.body);
    data = chData_;
    page = 0;
    notifyListeners();
  }

  chOne() {
    ch = 1;
    getData();
  }
  chTwo() {
    ch = 2;
    getData();
  }
  chThree() {
    ch = 3;
    getData();
  }
  chFour() {
    ch = 4;
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
