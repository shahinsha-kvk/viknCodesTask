// lib/pages/sale_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/sale_list_controller.dart';
import 'constants.dart'; // Make sure to import your constants

class SaleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SaleListController controller = Get.put(SaleListController());

    return Scaffold(
      backgroundColor: Colors.black, // Match the background color of the dashboard
      appBar: AppBar(
        title: Text(
          'Invoices',
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: GoogleFonts.poppins(color: Colors.white),
                      onChanged: (value) {
                        controller.searchItems(value);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 120, // Fixed width for the filter button
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle filter logic
                        Get.toNamed('/filter');
                      },
                      icon: Icon(Icons.filter_list, color: Colors.white),
                      label: Text(
                        'Add Filter',
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Background color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.saleList.length,
                itemBuilder: (context, index) {
                  final item = controller.saleList[index];
                  return ListTile(
                    title: Text(
                      'Invoice No: ${item.invoiceNo}', // Invoice number as title
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14, // Add font size
                        fontWeight: FontWeight.w400, // Add font weight
                      ),
                    ),
                    subtitle: Text(
                      'Customer: ${item.customerName}', // Customer name as subtitle
                      style: GoogleFonts.poppins(
                        color: Colors.grey[400],
                        fontSize: 15, // Add font size
                        fontWeight: FontWeight.w600, // Add font weight
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'SAR \$${item.amount.toStringAsFixed(2)}', // Amount
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          item.status, // Status
                          style: GoogleFonts.poppins(
                            color: item.status == 'Invoiced'
                                ? Colors.blue[800]
                                : item.status == 'Cancelled'
                                ? Colors.grey[500]
                                : Colors.red[800],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    tileColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
