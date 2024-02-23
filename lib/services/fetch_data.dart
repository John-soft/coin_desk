import 'package:coin_desk/constants/data.dart';
import 'package:coin_desk/models/coin_model.dart';
import 'package:http/http.dart' as http;

Future fetchData() async {
  try {
    final response = await http.get(Uri.parse(appUrl));
    if (response.statusCode == 200) {
      final data = coinModelFromJson(response.body);
    }
  } catch (e) {
    throw Exception('Error');
  }
}
