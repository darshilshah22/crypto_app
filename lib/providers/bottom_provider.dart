import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  setPageIndex(int val){
    _pageIndex = val;
    notifyListeners();
  }
}