import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileController extends GetxController {
  var userData = {}.obs;
  final storage = FlutterSecureStorage();
  var isLoading = false.obs;

  Future<void> fetchUserData() async {
    final userID = await storage.read(key: 'userID');
    if (userID == null) {
      Get.snackbar('Error', 'User not logged in');
      return;
    }

    isLoading(true);

    final response = await http.get(
      Uri.parse('https://www.api.viknbooks.com/api/v10/users/user-view/$userID/'),
    );

    isLoading(false);

    if (response.statusCode == 200) {
      userData.value = jsonDecode(response.body);
    } else {
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }
  //
  // Future<void> logout() async {
  //   await storage.deleteAll();
  //   Get.offAllNamed('/login');
  // }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      // Clear the user token or any other authentication data
      await storage.delete(key: 'userToken');
      await storage.delete(key: 'userID');
      // Navigate to the login screen
      Get.offNamed('/login');
    } catch (e) {
      Get.snackbar('Logout Error', 'Failed to log out: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }



}
