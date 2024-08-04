import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


final ProfileController profileController = Get.put(ProfileController());

class ProfileController extends GetxController {
  var userData = {}.obs;
  final storage = FlutterSecureStorage();
  var isLoading = false.obs;


  Future<void> logout() async {
    try {
      isLoading(true);
      await storage.delete(key: 'userToken');
      await storage.delete(key: 'userID');
      Get.offAllNamed('/login'); // Redirect to the login screen
    } catch (e) {
      Get.snackbar('Logout Error', 'Failed to log out: $e');
    } finally {
      isLoading(false);
    }
  }
}
