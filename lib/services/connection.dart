import 'dart:convert';

import 'package:http/http.dart' as http;

class Connection {
  Future<Map> getData() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2021-03-24&sortBy=publishedAt&apiKey=5d493ee7c4fc413c869879c09037c08c");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
        // print(data['status']);
      } else
        return {};
    } catch (e) {
      return {};
    }
  }
}
