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
            padding: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(15),
                    leading: Container(
                      width: 25,
                      height: 25,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/pngaaa_1.png'),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        loginController.obsecureLoginResponsemodel?.username ??
                            "name",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        loginController
                                .obsecureLoginResponsemodel?.data?.email ??
                            "email",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.blue[200],
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Container(
                            decoration: ShapeDecoration(
                              color: Colors.blue[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white24),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Icon(Icons.star_rate_outlined,
                                color: Colors.black),
                          ),
                          title: Text(
                            'Rating',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Total: ${profileController.userData['totalRatings'] ?? 'N/A'}',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.blue[200],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Container(
                            decoration: ShapeDecoration(
                              color: Colors.green[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white24),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
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
                              color: Colors.green[300],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
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
                  ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      color: Colors.blue[200],
                      size: 16,
                    ),
                    title: Text(
                      'Help',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.question_answer,
                        color: Colors.blue[200], size: 16),
                    title: Text(
                      'FAQ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.person_add_alt_1_outlined,
                        color: Colors.blue[200], size: 16),
                    title: Text(
                      'Invite Friends',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.description_outlined,
                        color: Colors.blue[200], size: 16),
                    title: Text(
                      'Terms of Service',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined,
                        color: Colors.blue[200], size: 16),
                    title: Text(
                      'Privacy Policy',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
