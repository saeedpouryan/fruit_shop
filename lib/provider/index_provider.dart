import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier{
  int currentClickFruit = 0;

  setNewValue(int index){
    currentClickFruit = index;
    notifyListeners();
  }
}