import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/login_response_model.dart';
import '../services/auth_service.dart';

final LoginController loginController = Get.put(LoginController());

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  LoginResponseModel? obsecureLoginResponsemodel;

  var obscurePassword = true.obs;
  var isLoading = false.obs;

  // Function to handle login
  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter username and password');
      return ;
    }
    isLoading.value = true;
    final response = await AuthService.login(username, password);
    isLoading.value = false;

    if (response != null && response.username!= null) {
      obsecureLoginResponsemodel  = response;

      await _storage.write(key: 'token', value: response.data?.refresh);
      await _storage.write(key: 'userID', value: response.userId?.toString());
      Get.snackbar('Welcome',
        ' ${response.message}, welcome ${response.username}!',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blue[200],
      );
      await Get.offNamed('/dashboard');
    } else {
      Get.snackbar('Error', 'user not found',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red[200],
      );
    }
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
