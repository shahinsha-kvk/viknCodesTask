// lib/controllers/sale_list_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/sales_list_model.dart'; // Ensure this path is correct

class SaleListController extends GetxController {
  final storage = FlutterSecureStorage();
  var isLoading = false.obs;
  var saleList = <SaleItem>[].obs; // List of SaleItem
  var searchQuery = ''.obs;

  Future<void> fetchSaleList(int pageNumber) async {
    isLoading(true);

    try {
      final token = await storage.read(key: 'token');
      final userID = await storage.read(key: 'userID');

      final requestPayload = {
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": int.parse(userID!),
        "PriceRounding": 2,
        "page_no": pageNumber,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1,
      };

      final response = await http.post(
        Uri.parse('https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestPayload),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        saleList.value = (data['items'] as List)
            .map((item) => SaleItem.fromJson(item))
            .toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch sale list: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchItems(String query) {
    searchQuery.value = query;
    // Add filtering logic based on searchQuery
  }
}
