import 'dart:convert';

import 'package:tt_book/models/search_model.dart';
import 'package:dio/dio.dart';

class SearchDao {
  static Future<SearchModel> fetch(String url) async {
    final Response response = await Dio().get(url);
    if (response.statusCode == 200) {
//      var result = json.decode(response.data);
      return SearchModel.fromJson(response.data);
    }else{
       throw Exception('failed to  load http json ');
    }
  }
}
