
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:untitled/controllers/sale_list_controller.dart';
import 'constants.dart';



class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String _selectedStatus = 'Pending'; // Default status
  String? _selectedCustomer;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  final List<String> _statusOptions = ['Pending', 'Invoiced', 'Cancelled'];
  final List<String> _customerOptions = ['Customer 1', 'Customer 2', 'Customer 3']; // Example customer list

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != (isFromDate ? _fromDate : _toDate)) {
      setState(() {
        if (isFromDate) {
          _fromDate = selectedDate;
        } else {
          _toDate = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Match the background color of the dashboard
      appBar: AppBar(
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Filters',
                    style: GoogleFonts.poppins(
                      color: textColor, // Ensure this is defined in your constants
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle filter action
                  // You might want to call a function to apply filters here
                  Get.snackbar('Filter', 'Filter action button pressed');
                },
                child: Text(
                  'Filter',
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add filters',
                style: GoogleFonts.poppins(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _fromDate == null ? '' : _dateFormat.format(_fromDate!)),
                    decoration: InputDecoration(
                      hintText: 'From Date',
                      filled: true,
                      fillColor: Colors.grey[800],
                      prefixIcon: Icon(Icons.calendar_month, color: primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
                    readOnly: true,
                    onTap: () => _selectDate(context, true),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _toDate == null ? '' : _dateFormat.format(_toDate!)),
                    decoration: InputDecoration(
                      hintText: 'To Date', // Changed to hintText
                      filled: true,
                      fillColor: Colors.grey[800],
                      prefixIcon: Icon(Icons.calendar_month, color: primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
                    readOnly: true,
                    onTap: () => _selectDate(context, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 7.0, // Adjust spacing between chips
              runSpacing: 5.0, // Adjust spacing between rows
              children: _statusOptions.map((status) {
                return ChoiceChip(
                  label: Text(status),
                  selected: _selectedStatus == status,
                  onSelected: (selected) {
                    setState(() {
                      _selectedStatus = selected ? status : _selectedStatus;
                    });
                  },
                  selectedColor: primaryColor,
                  backgroundColor: Colors.grey[800],
                  labelStyle: GoogleFonts.poppins(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w400,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _selectedCustomer,
              hint: Text(
                'Customer',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              items: _customerOptions.map((customer) {
                return DropdownMenuItem<String>(
                  value: customer,
                  child: Text(customer, style: GoogleFonts.poppins(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCustomer = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.person, color: primaryColor),
              ),
              style: GoogleFonts.poppins(color: Colors.white),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: salesController.getFilteredSalesItem(_selectedStatus).length,    //sssssssssssssssssssssssssssssssssssjjjjjjjjjjjjjjjjsssssssssss
                itemBuilder: (context, index) {
                  final item = salesController.getFilteredSalesItem(_selectedStatus);
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
        ),
      ),
    );
  }
}
