import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';

class NetworkClient {
  static Future<http.Response?> post(
      {required String endpoint, Object? body}) async {
    final response = await http.post(
      Uri.parse(appUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 400) {
      return null;
    } else if (response.statusCode == 401) {
      return null;
    }
  }
}
