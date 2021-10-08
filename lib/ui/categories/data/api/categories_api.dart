import 'dart:convert';

import 'package:eat_ziffy_task/network/apiUrl/apiUrl_ui.dart';
import 'package:eat_ziffy_task/ui/categories/data/model/categories_model.dart';
import 'package:http/http.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CategoriesApi {
  Future<List<CategoriesModel>> getCategoriesApiData() async {
    // Dio dio = Dio();
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: false,
    //   error: true,
    //   compact: true,
    //   maxWidth: 90,
    // ));

    Response response = await get(Uri.parse(baseUrl + categories));
    print("status code : ${response.statusCode}");
    print("body : ${response.body}");

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return data
            .map<CategoriesModel>((x) => CategoriesModel.fromJson(x))
            .toList();

        // CategoriesModel dataList =
        //data.map((x) => CategoriesModel.fromJson(x));
        // CategoriesModel.fromJson(data);

      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
