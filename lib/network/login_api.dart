import 'dart:convert';

import 'package:assigned_task/model/login_model.dart';
import 'package:http/http.dart' as http;

Future<Login> createUser() async {
  http.Response response = await http.post(
    Uri.parse('http://nodejs-register-login-app.herokuapp.com'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      // 'email': email,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Login.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
