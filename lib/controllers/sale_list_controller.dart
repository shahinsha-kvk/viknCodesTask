import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/sales_list_model.dart';

final SaleListController salesController = Get.put(SaleListController());

class SaleListController extends GetxController {
  final storage = FlutterSecureStorage();
  var isLoading = false.obs;
  var saleList = <SaleItem>[].obs; // List of SaleItem
  var filteredSaleList = <SaleItem>[].obs; // List of filtered SaleItem
  var searchedSaleList = <SaleItem>[].obs; // List of searched SaleItem
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSales();
  }

  void fetchSales() {
    // Using the hardcoded data
    saleList.assignAll(getSalesItem());
    filteredSaleList.assignAll(saleList);
    searchedSaleList.assignAll(saleList);
  }

  List<SaleItem> getFilteredSalesItem(String status) {
    var list = getSalesItem();
    List<SaleItem> templist = [];

    for (int i = 0; i < list.length; i++) {
      if (list[i].status == status) {
        print(list[i].status);
        templist.add(list[i]);
      }
    }
    return templist;
  }

  void getSearchedSalesItem(String value) {
    var list = getSalesItem();
    List<SaleItem> templist = [];

    for (int i = 0; i < list.length; i++) {
      if (list[i].customerName.toLowerCase().contains(value.toLowerCase())) {
        print(list[i].customerName);
        templist.add(list[i]);
      }
    }
    searchedSaleList.value = templist;
  }

  List<SaleItem> getSalesItem() {
    return [
      SaleItem(
          id: 1,
          customerName: "Manaf",
          amount: 5345,
          invoiceNo: 2122,
          status: "Pending"),
      SaleItem(
          id: 2,
          customerName: "Sura mac",
          amount: 26465,
          invoiceNo: 21882,
          status: "Invoiced"),
      SaleItem(
          id: 3,
          customerName: "Shahin sha",
          amount: 36451,
          invoiceNo: 4490,
          status: "Cancelled"),
      SaleItem(
          id: 4,
          customerName: "Fahim kalil",
          amount: 5045,
          invoiceNo: 9765,
          status: "Pending"),
      SaleItem(
          id: 5,
          customerName: "Raju",
          amount: 15136,
          invoiceNo: 7116,
          status: "Invoiced"),
      SaleItem(
          id: 6,
          customerName: "Rabeeh",
          amount: 4652,
          invoiceNo: 30065,
          status: "Cancelled"),
      SaleItem(
          id: 7,
          customerName: "Ashok",
          amount: 6423,
          invoiceNo: 5401,
          status: "Invoiced"),
      SaleItem(
          id: 8,
          customerName: "Thahseena",
          amount: 10250,
          invoiceNo: 6203,
          status: "Invoiced"),
      SaleItem(
          id: 8,
          customerName: "Yousef k",
          amount: 10250,
          invoiceNo: 3884,
          status: "Invoiced"),
      SaleItem(
          id: 9,
          customerName: "Jubairiya",
          amount: 25546,
          invoiceNo: 95362,
          status: "Pending"),
      SaleItem(
          id: 10,
          customerName: "Anilkumar",
          amount: 6240,
          invoiceNo: 4652,
          status: "Pending"),
      SaleItem(
          id: 11,
          customerName: "Musthafa",
          amount: 30045,
          invoiceNo: 6110,
          status: "Invoiced"),
      SaleItem(
          id: 12,
          customerName: "Jaseela nasri",
          amount: 5697,
          invoiceNo: 7542,
          status: "Invoiced"),
      SaleItem(
          id: 13,
          customerName: "Amrutha",
          amount: 6579,
          invoiceNo: 1328,
          status: "Pending"),
      SaleItem(
          id: 14,
          customerName: "Hashin",
          amount: 32456,
          invoiceNo: 9088,
          status: "Invoiced"),
    ];
  }

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
        Uri.parse(
            'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
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
        Get.snackbar(
          'Error',
          'Failed to fetch sale list: ${response.body}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue[200],
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue[200],
      );
    } finally {
      isLoading(false);
    }
  }

}
