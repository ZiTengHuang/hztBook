import 'package:flutter/material.dart';



class CountProvider extends ChangeNotifier{
       int _count = 0 ;

       get value => _count;

       void increment(){
          _count ++;
         notifyListeners();
       }
}