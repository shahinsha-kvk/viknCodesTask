import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';
import '../controllers/profile_controller.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      'assets/images/pngaaa_1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Center(
                    child: Text(
                      loginController.obsecureLoginResponsemodel?.username ??
                          "name",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16 ,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      loginController.obsecureLoginResponsemodel?.data?.email ??
                          "email",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white, size: 18),
                    onPressed: () {},
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .grey[900], // Background color for the Container
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: ShapeDecoration(
                              color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white24),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 6),
                            child: Icon(Icons.star_rate_outlined,
                                color: Colors.black),
                          ),
                          title: Text(
                            '4.3',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            '2,211',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .grey[900], // Background color for the Container
                          borderRadius: BorderRadius.circular(
                              20), // Curved corners for the Container
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: ShapeDecoration(
                              color: Colors.green[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.white24),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 6),
                            child: Icon(Icons.verified_user_outlined,
                                color: Colors.black),
                          ),
                          title: Text(
                            'KYV',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Verified',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.green[100],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: profileController.logout,
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.red[900],
                      size: 18,
                    ),
                    label: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                _buildListTile(
                  icon: Icons.help_outline,
                  title: 'Help',
                  route: '/help',
                ),
                SizedBox(height: 10),
                _buildListTile(
                  icon: Icons.question_answer,
                  title: 'FAQ',
                  route: '/faq',
                ),
                SizedBox(height: 8),
                _buildListTile(
                  icon: Icons.person_add_alt_1_outlined,
                  title: 'Invite Friends',
                  route: '/invite-friends',
                ),
                SizedBox(height: 8),
                _buildListTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  route: '/terms-of-service',
                ),
                SizedBox(height: 8),
                _buildListTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  route: '/privacy-policy',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[200], size: 18),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17),
      onTap: () {
        try {
          Get.toNamed(route);
        } catch (e) {
          // Get.snackbar(
          //   // 'Navigation Error',
          //   // 'Failed to navigate: $e',
          //   // snackPosition: SnackPosition.BOTTOM,
          //   // backgroundColor: Colors.blue[200],
          // );
        }
      },
    );
  }
}
