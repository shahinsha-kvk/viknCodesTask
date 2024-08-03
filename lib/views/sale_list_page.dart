// lib/pages/sale_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sale_list_controller.dart';

class SaleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SaleListController controller = Get.put(SaleListController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Sale List'),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.searchItems(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.saleList.length,
                itemBuilder: (context, index) {
                  final item = controller.saleList[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    onTap: () {
                      // Handle item tap if needed
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
