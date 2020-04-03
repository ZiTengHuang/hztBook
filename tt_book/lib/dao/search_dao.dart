
import 'package:tt_book/models/search_model.dart';
import 'package:dio/dio.dart';

class SearchDao {
  static Future<SearchModel> fetch(String url, String keyWork) async {
    final Response response = await Dio().get(url);
    if (response.statusCode == 200) {
//      var result = json.decode(response.data);
      SearchModel model = SearchModel.fromJson(response.data);
      model.keyWork = keyWork;
      return model;
    } else {
      throw Exception('failed to  load http json ');
    }
  }
}
