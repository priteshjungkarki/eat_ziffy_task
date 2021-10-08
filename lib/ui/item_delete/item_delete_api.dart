import 'package:eat_ziffy_task/network/apiUrl/apiUrl_ui.dart';
import 'package:http/http.dart';

class DeleteItemApi {
  deleteItemsDataApi(int id) async {
    String itemId = "items/$id";

    Response response = await delete(Uri.parse(baseUrl + itemId));
    print("status code : ${response.statusCode}");

    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
