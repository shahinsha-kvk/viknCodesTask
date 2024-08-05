import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/sale_list_controller.dart';
import 'constants.dart'; // Make sure to import your constants

class SaleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
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

        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[800]!, width: 1),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon:
                                Icon(Icons.search, color: Colors.white),
                                hintText: 'Search name',
                                hintStyle:
                                GoogleFonts.poppins(color: Colors.green,fontSize: 14),
                                filled: true,
                                fillColor: Colors.grey[800],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: GoogleFonts.poppins(color: Colors.white),
                              onChanged: (value) {
                                salesController.getSearchedSalesItem(value);
                              },
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: 120, // Fixed width for the filter button
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Handle filter logic
                                Get.toNamed('/filter');
                              },
                              icon: Icon(Icons.filter_list,
                                  color: primaryColor, size: 18),
                              label: Text(
                                'Add filters',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[
                                800], // Background color of the button
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
                    Divider(height: 5),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: salesController.searchedSaleList.length,
                  itemBuilder: (context, index) {
                    final item = salesController.searchedSaleList[index];
                    print('Displaying item: $item'); // Debug: Print each item
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Invoice No: ${item.invoiceNo}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12, // Add font size
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          subtitle: Text(
                            'Name: ${item.customerName}', // Customer name as subtitle
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
                              Text(
                                'SAR \$${item.amount.toStringAsFixed(2)}', // Amount
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
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
