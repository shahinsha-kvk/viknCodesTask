// lib/pages/sale_list_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/sale_list_controller.dart';
import 'constants.dart'; // Make sure to import your constants

class SaleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

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
        // Debug: Print the loading status and sale list length
        print('Is Loading: ${salesController.isLoading.value}');
        print('Sale List Length: ${salesController.saleList.length}');

        if (salesController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey[800]!, width: 1),
                ),
                padding: const EdgeInsets.all(8.0),
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
                          salesController.searchItems(value);
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
                        icon: Icon(Icons.filter_list, color: primaryColor,size: 18,),
                        label: Text(
                          'Add filters',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800], // Background color of the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: salesController.getSalesItem().length,
                itemBuilder: (context, index) {
                  final item = salesController.getSalesItem();
                  print('Displaying item: $item'); // Debug: Print each item
                  return ListTile(
                    title: Text(
                      'Invoice No: ${item[index].invoiceNo}', // Invoice number as title
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14, // Add font size
                        fontWeight: FontWeight.w400, // Add font weight
                      ),
                    ),
                    subtitle: Text(
                      'Customer: ${item[index].customerName}', // Customer name as subtitle
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
                          item[index].status, // Status
                          style: GoogleFonts.poppins(
                            color: item[index].status == 'Invoiced'
                                ? Colors.blue[800]
                                : item[index].status == 'Cancelled'
                                ? Colors.grey[500]
                                : Colors.red[800],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'SAR \$${item[index].amount.toStringAsFixed(2)}', // Amount
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
