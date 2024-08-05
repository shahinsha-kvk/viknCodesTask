import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/bottomNavigationbar_controller.dart';
import 'constants.dart';

class DashboardScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: ListTile(
            leading: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                'assets/images/cabzing.png',

                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              'CabZing',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _navigateToProfile(),
                  child: Container(
                    padding: const EdgeInsets.only(right: 2),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey[900],
                      child: Icon(Icons.person_outline, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        leadingWidth: 80, // Adjust leading width if needed
        titleSpacing: 0, // Optional: Adjust title spacing if needed
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Adjust padding as needed
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTopSection(),
                  SizedBox(height: 20),
                  _buildListTile(
                    title: 'Bookings',
                    subtitle: 'Booked details',
                    additionalInfo: 'Reserved',
                    icon: Icons.animation_rounded,
                    route: '',
                    trailing: Icon(Icons.arrow_forward, color: textColor),
                    selectedTileColor: Colors.teal[300],
                  ),
                  SizedBox(height: 25),
                  _buildListTile(
                    title: 'Invoice',
                    subtitle: '28654.00',
                    additionalInfo: 'Rupees',
                    icon: Icons.currency_rupee,
                    route: '/sale-list',
                    trailing: Icon(Icons.arrow_forward, color: textColor),
                    selectedTileColor: Colors.teal[300],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  child: Stack(
                    children: [
                      // Add any additional blurred circles or background elements here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.blue[400],
        ),
        child: Obx(() => BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[800],
          currentIndex: controller.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.adjust_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
          onTap: (index) => _onBottomNavTap(index),
        )),
      ),
    );
  }

  void _navigateToProfile() {
    try {
      Get.toNamed('/profile');
    } catch (e) {
      Get.snackbar(
        'Navigation Error',
        'Failed to navigate: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue[200],
      );
    }
  }

  void _onBottomNavTap(int index) {
    controller.changeIndex(index);
    switch (index) {
      case 0:
      // Home
        break;
      case 1:
      // Second button action
        break;
      case 2:
      // Third button action
        break;
      case 3:
        _navigateToProfile();
        break;
    }
  }
  Widget _buildTopSection() {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white24),
        ),
      ),
      padding: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              decoration: ShapeDecoration(
                color: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
              child: Icon(Icons.stacked_line_chart_rounded, color: Colors.green[600]),
            ),
            title: Text(
              "SAR",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: textColor,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5,63,188.00",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  "other info",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
            trailing: Text("Revenue",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: textColor,
            ),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {

              }
          ),
          SizedBox(height: 15),
          _buildDashboardTitle(),
        ],
      ),
    );
  }
  Widget _buildDashboardTitle() {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.white24),
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/container_x2_1.png',
            width: double.infinity,
            height: 140,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10), // Spacing between the image and the text
          Center(
            child: Text(
              'July 2024',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: textColor,
              ),
            ),
          ),
          SizedBox(height: 5), // Spacing between the lines of text
          Center(
            child: Text(
              '01  02  03  04  05  06  07  08  09',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildListTile({
    required String title,
    required String subtitle,
    required String additionalInfo,
    required IconData icon,
    required String route,
    required Widget trailing,
    required Color? selectedTileColor,
  }) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white24),
        ),
      ),
      child: ListTile(
        leading: Container(
          decoration: ShapeDecoration(
            color: Colors.green[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
          child: Icon(icon, color: primaryColor),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w200,
            fontSize: 12,
            color: textColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            Text(
              additionalInfo,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: trailing,
        selectedTileColor: selectedTileColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: () {
           {
            Get.toNamed(route);
          }
        },
      ),
    );
  }

}
