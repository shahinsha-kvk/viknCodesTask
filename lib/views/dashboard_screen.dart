
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
                Get.snackbar('Navigation Error', 'Failed to navigate: $e');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent,
                child: SvgPicture.asset(
                  'assets/images/pngaaa_1.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTopSection(),
                    SizedBox(height: 17),
                    _buildListTile(
                      title: 'Bookings',
                      subtitle: 'View your sales here',
                      icon: Icons.sticky_note_2_rounded,
                      route: '/sale-listffffffffffffffffffffffffffffffffffffff',
                      trailing: Icon(Icons.arrow_forward, color: textColor),
                      dense: true,
                      focusColor: Colors.teal[100],
                      hoverColor: Colors.teal[50],
                      tileColor: Colors.grey[800],
                      selectedTileColor: Colors.teal[300],
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    SizedBox(height: 20),
                    _buildListTile(
                      title: 'Invoice',
                      subtitle: '545445444545545454455.00',
                      icon: Icons.currency_rupee,
                      route: '/sale-list',
                      trailing: Icon(Icons.arrow_forward, color: Colors.white),
                      dense: true,
                      focusColor: Colors.teal[100],
                      hoverColor: Colors.teal[50],
                      tileColor: Colors.grey[800],
                      selectedTileColor: Colors.teal[300],
                      visualDensity: VisualDensity.adaptivePlatformDensity,
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
                      _buildBlurredCircle(Color(0xFFEEF263)),
                      Positioned(
                        right: 0,
                        child: _buildBlurredCircle(Color(0xFFEEF223)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1, color: Colors.grey[700]),
          Obx(() => BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            currentIndex: controller.selectedIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.circle),
                label: 'Second',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Third',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
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
                    Get.snackbar('Navigation Error', 'Failed to navigate: $e');
                  }
                  break;
              }
            },
          )),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildDashboardTitle(),
      ],
    );
  }

  Widget _buildDashboardTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildBlurredCircle(Color(0xFFEEF263)),
        _buildBlurredCircle(Color(0xFFEEF223)),
        Container(
          margin: EdgeInsets.only(top: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Dashboard',
                style: headerTextStyle,
              ),
              Text(
                'Welcome to your dashboard',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFF838383),
                ),
              ),
              Image.asset(
                'assets/images/container_x2.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBlurredCircle(Color color) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 130, sigmaY: 130),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        width: 33,
        height: 44,
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
    required Widget trailing,
    required bool dense,
    required Color? focusColor,
    required Color? hoverColor,
    required Color? tileColor,
    required Color? selectedTileColor,
    required VisualDensity visualDensity,
  }) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: textColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: Colors.grey[400],
        ),
      ),
      trailing: trailing,
      dense: dense,
      focusColor: focusColor,
      hoverColor: hoverColor,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      visualDensity: visualDensity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onTap: () {
        try {
          Get.toNamed(route);
        } catch (e) {
          Get.snackbar('Navigation Error', 'Failed to navigate: $e');
        }
      },
    );
  }
}
