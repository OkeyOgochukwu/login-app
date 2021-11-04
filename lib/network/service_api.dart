import 'dart:convert';

import 'package:assigned_task/model/news_model.dart';
import 'package:http/http.dart' as http;

Future<List<News>> getAllNew() async {
  http.Response response = await http.get(
    Uri.parse('https://api.first.org/data/v1/news'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8 ',
    },
  );
  // return response.body;
  if (response.statusCode == 200) {
    print(response.body);

    // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    // return parsed.map<News>((item) => News.fromJson(item)).toList();
    var json = jsonDecode(response.body);
    Iterable data = json['data'];
    return data.map((item) => News.fromJson(item)).toList();
  } else {
    throw 'unable to fetch news';
  }
}
