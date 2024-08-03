import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/profile_controller.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Obx(() {
          if (controller.isLoading.value) {
            return Text('Loading...', style: GoogleFonts.poppins(color: Colors.white));
          }
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pngaaa_1.png'),
            ),
            title: Text(
              controller.userData['name'] ?? 'Name',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              controller.userData['email'] ?? 'Email',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.blue[200],
              ),
            ),
          );
        }),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Get.snackbar('Edit', 'Edit profile functionality coming soon!');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.userData.isEmpty) {
              return Center(
                child: Text(
                  'No user data found',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.star_rate_outlined, color: Colors.black),
                  ),
                  title: Text(
                    'Rating: ${controller.userData['rating'] ?? 'N/A'}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Total: ${controller.userData['totalRatings'] ?? 'N/A'}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.blue[200],
                    ),
                  ),
                  trailing: Text(
                    'Name',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.verified_user_outlined, color: Colors.black),
                  ),
                  title: Text(
                    'KYV',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Verified',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.green[300],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      iconColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: controller.logout,
                    icon: Icon(Icons.logout_rounded, color: Colors.red),
                    label: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.white),
                  title: Text(
                    'Help',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.question_answer, color: Colors.white),
                  title: Text(
                    'FAQ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
                  title: Text(
                    'Invite Friends',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.description_outlined, color: Colors.white),
                  title: Text(
                    'Terms of Service',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined, color: Colors.white),
                  title: Text(
                    'Privacy Policy',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[200]),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
