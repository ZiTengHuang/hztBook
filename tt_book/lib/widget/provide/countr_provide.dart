import 'package:flutter/material.dart';

class CounterProvide with ChangeNotifier {
  int _count = 0;

  int getCount() => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}
