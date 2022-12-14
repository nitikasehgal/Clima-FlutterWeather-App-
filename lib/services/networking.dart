import 'package:clima/screens/loading_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodeddata = jsonDecode(data);
      return decodeddata;
    } else {
      print(response.statusCode);
    }
  }
}
