import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/group_x2.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            Text(
              'CabZing',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
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
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[900],
                child: IconButton(
                  icon: Icon(Icons.person_outline, color: Colors.white),
                  onPressed: () {
                    Get.snackbar(
                      'Edit',
                      'Edit profile functionality coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blue[200],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTopSection(),
                  Text('helloooooooooooooo'),
                  SizedBox(height: 20),
                  _buildListTile(
                    title: 'Bookings',
                    subtitle: 'Booked details',
                    additionalInfo: 'Reserved', // New row
                    icon: Icons.animation_rounded,
                    route: '/sale-listmm',
                    trailing: Icon(Icons.arrow_forward, color: textColor),
                    selectedTileColor: Colors.teal[300],
                  ),
                  SizedBox(height: 25),
                  _buildListTile(
                    title: 'Invoice',
                    subtitle: '5455',
                    additionalInfo: 'Rupees', // New row
                    icon: Icons.currency_rupee,
                    route: '/sale-list',
                    trailing: Icon(Icons.arrow_forward, color: textColor),
                    selectedTileColor: Colors.teal[300],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100, // Adjust height as needed
                child: Stack(
                  children: [
                    // _buildBlurredCircle(Color(0xFFEEF263)),
                    // Positioned(
                    //   right: 0,
                    //   child: _buildBlurredCircle(Color(0xFFEEF223)),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.black, // Background color of the BottomNavigationBar
          primaryColor: Colors.blue[400], // Selected item color
          textTheme: Theme.of(context).textTheme.copyWith(
              // caption: TextStyle(color: Colors.grey[400]), // Unselected item color
              ),
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
              onTap: (index) {
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
                    break;
                }
              },
            )),
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTile(
          title: 'SAR',
          subtitle: 'amount',
          additionalInfo: 'info about last month', // New row
          icon: Icons.auto_graph_sharp,
          route: '/sale-listnnnnn',
          trailing: Text("Revenue",
              style: TextStyle(color: Colors.white, fontSize: 14)),
          selectedTileColor: Colors.teal[300],
        ),
        _buildDashboardTitle(),
      ],
    );
  }

  Widget _buildDashboardTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.white24),
              ),
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/container_x2_1.png',
              width: double.infinity,
              height: 140,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required String additionalInfo, // New parameter for additional row
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
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
          try {
            Get.toNamed(route);
          } catch (e) {
            Get.snackbar(
              'Navigation Error',
              'Failed to navigate: $e',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.blue[200],
            );
          }
        },
      ),
    );
  }
}
