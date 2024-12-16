import 'package:http/http.dart' as http;
import 'key.dart'; // Make sure 'key.dart' exists
import 'dart:convert';

class Networking {
  Future<dynamic> getData(String? currency) async {
    // Handle null safety for currency
    if (currency == null || currency.isEmpty) {
      print('Currency is null or empty');
      return null;
    }

    try {
      var url = Uri.https(
        'rest.coinapi.io',
        '/v1/exchangerate/BTC/$currency',
        {'apikey': KEY},
      );

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
