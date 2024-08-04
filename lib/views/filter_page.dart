// lib/pages/filter_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart'; // Import your constants for colors and styles
import 'package:intl/intl.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime? _fromDate;
  DateTime? _toDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

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
        title: Text(
          'Filters',
          style: GoogleFonts.poppins(
            color: textColor, // Ensure this is defined in your constants
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              // Handle filter action
              // You might want to call a function to apply filters here
              Get.snackbar('Filter', 'Filter action button pressed');
            },
            child: Text(
              'Filter',
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Date Range',
              style: GoogleFonts.poppins(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _fromDate == null ? '' : _dateFormat.format(_fromDate!)),
                    decoration: InputDecoration(
                      labelText: 'From Date',
                      filled: true,
                      fillColor: Colors.grey[800],
                      prefixIcon: Icon(Icons.calendar_month, color: primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.white),
                    readOnly: true,
                    onTap: () => _selectDate(context, true),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: _toDate == null ? '' : _dateFormat.format(_toDate!)),
                    decoration: InputDecoration(
                      labelText: 'To Date',
                      filled: true,
                      fillColor: Colors.grey[800],
                      prefixIcon: Icon(Icons.calendar_month, color: primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.white),
                    readOnly: true,
                    onTap: () => _selectDate(context, false),
                  ),
                ),
              ],
            ),
            // Add more filter options as needed
          ],
        ),
      ),
    );
  }
}
