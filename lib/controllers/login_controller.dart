import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Observable to manage password obscuring
  var obscurePassword = true.obs;
  var obscureisloading = false.obs;

  // Function to handle login
  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter username and password');
      return;
    }
    obscureisloading.value = true;
    final response = await AuthService.login(username, password);
    obscureisloading.value = false;

    if (response != null) {
      await _storage.write(key: 'token', value: response.data?.refresh);
      await _storage.write(key: 'userID', value: response.userId?.toString());
      await Get.offNamed('/dashboard');
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }

  // Method to toggle the visibility of the password
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
