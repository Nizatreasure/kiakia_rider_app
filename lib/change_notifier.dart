
import 'package:flutter/material.dart';

class ChangeBottomNavigationBarIndex extends ChangeNotifier {

  int currentIndex = 0;

  void updateCurrentIndex (int currentIndex) {
    this.currentIndex = currentIndex;
    notifyListeners();
  }

}