import 'dart:convert';

import 'package:eat_ziffy_task/network/apiUrl/apiUrl_ui.dart';
import 'package:eat_ziffy_task/ui/labels_data/labels_data_model.dart';
import 'package:http/http.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LabelsDataApi {
  Future<List<LabelItems>> getLabelsDataApi(int categoryId) async {
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

    String itemLabel = "items?catId=$categoryId";

    Response response = await get(Uri.parse(baseUrl + itemLabel));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return data.map<LabelItems>((x) => LabelItems.fromJson(x)).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
