import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_response_model.dart';
import 'endpoints.dart';
import 'network_client.dart';

class AuthService {
  static Future<LoginResponseModel?> login(
      String username, String password) async {
    var response = await NetworkClient.post(
        endpoint: Endpoints.login,
        body: jsonEncode(<String, dynamic>{
          "username": username,
          "password": password,
          "is_mobile": true
        }));
    if (response != null && response.statusCode == 200) {
      final loginResponseModel = loginResponseModelFromJson(response.body);
      return loginResponseModel;
    } else {
      return null;
    }
  }
}
