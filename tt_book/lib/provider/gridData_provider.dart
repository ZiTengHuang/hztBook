import 'package:flutter/material.dart';
import 'package:tt_book/models/post.dart';

class GridDataProvider extends ChangeNotifier {
  get data => posts;

  get dataLength => posts.length;
  Post post = posts[0];

  get indexData => post;

  deleteData(int index) {
    posts.removeAt(index);
    notifyListeners();
  }

  getIndexData(int index) {
    post = posts[index];
    notifyListeners();
  }
}
