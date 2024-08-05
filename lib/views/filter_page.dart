import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controllers/sale_list_controller.dart';
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
  final List<String> _customerOptions = [
    'Customer 1',
    'Customer 2',
    'Customer 3'
  ];

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null &&
        selectedDate != (isFromDate ? _fromDate : _toDate)) {
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
    final filteredItems = salesController.getFilteredSalesItem(_selectedStatus);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Expanded(
                  child: Text(
                    'Filters',
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add filter action logic here if needed
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
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              child: Column(
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
                          controller: TextEditingController(
                              text: _fromDate == null
                                  ? ''
                                  : _dateFormat.format(_fromDate!)),
                          decoration: InputDecoration(
                            hintText: 'From Date',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: Colors.grey[800],
                            prefixIcon:
                            Icon(Icons.calendar_month, color: primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                          readOnly: true,
                          onTap: () => _selectDate(context, true),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                              text: _toDate == null
                                  ? ''
                                  : _dateFormat.format(_toDate!)),
                          decoration: InputDecoration(
                            hintText: 'To Date',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: Colors.grey[800],
                            prefixIcon:
                            Icon(Icons.calendar_month, color: primaryColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                          readOnly: true,
                          onTap: () => _selectDate(context, false),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 5.0,
                    children: _statusOptions.map((status) {
                      return ChoiceChip(
                        label: Text(status),
                        selected: _selectedStatus == status,
                        onSelected: (selected) {
                          setState(() {
                            _selectedStatus =
                            selected ? status : _selectedStatus;
                          });
                        },
                        selectedColor: primaryColor,
                        backgroundColor: Colors.grey[800],
                        labelStyle: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  // Uncomment and use the DropdownButtonFormField if needed
                  // DropdownButtonFormField<String>(
                  //   value: _selectedCustomer,
                  //   hint: Text(
                  //     'Customer',
                  //     style: GoogleFonts.poppins(color: Colors.white),
                  //   ),
                  //   items: _customerOptions.map((customer) {
                  //     return DropdownMenuItem<String>(
                  //       value: customer,
                  //       child: Text(customer,
                  //           style: GoogleFonts.poppins(color: Colors.white)),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _selectedCustomer = value;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.grey[800],
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: BorderSide.none,
                  //     ),
                  //     prefixIcon: Icon(Icons.person, color: primaryColor),
                  //   ),
                  //   style: GoogleFonts.poppins(color: Colors.white),
                  // ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Divider(height: 5),
            SizedBox(height: 10),
            Expanded(
              child: filteredItems.isEmpty
                  ? Center(
                child: Text(
                  'No results found',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Invoice No: ${item.invoiceNo}',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        subtitle: Text(
                          'Name: ${item.customerName}',
                          style: GoogleFonts.poppins(
                            color: Colors.grey[400],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item.status,
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
                              'SAR \$${item.amount.toStringAsFixed(2)}',
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
      ),
    );
  }
}
