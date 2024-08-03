import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: backgroundColor),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 10)
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTopSection(),
                          SizedBox(height: 17),
                          _buildLoginForm(),
                          SizedBox(height: 17),
                          _buildForgotPassword(),
                          SizedBox(height: 17),
                          _buildSignInButton(),
                          SizedBox(height: 140),
                          _buildDontHaveAccount(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLanguageSelector(),
        _buildLoginTitle(),
      ],
    );
  }

  Widget _buildLanguageSelector() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.sort_by_alpha_outlined, color: primaryColor, size: 20),
          SizedBox(width: 8),
          Text(
            'English',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTitle() {
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
              Text(
                'Login',
                style: headerTextStyle,
              ),
              Text(
                'Login to your vikn account',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFF838383),
                ),
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

  Widget _buildSignInButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          final username = usernameController.text;
          final password = passwordController.text;
          controller.login(username, password);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign in',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_outlined,
              color: Colors.white, size: 24), // Replace SVG icon
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String hintText,
      String validationError,
      FormFieldValidator<String>? validator, {
        bool obscureText = false,
      }) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            obscureText ? Icons.key_outlined : Icons.person_outline,
            color: primaryColor,
            size: 23,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextFormField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: hintText,
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF7D7D7D),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF7D7D7D),
                  ),
                  border: InputBorder.none,
                  suffixIcon: obscureText
                      ? IconButton(
                    icon: Icon(Icons.visibility,
                        color: primaryColor, size: 20),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                      : null,
                ),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white,
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1C3347)),
              borderRadius: BorderRadius.circular(11),
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _buildTextField(
                    usernameController,
                    'Username',
                    'Please enter your username',
                        (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your username';
                      if (value.length < 3)
                        return 'Must be at least 3 characters';
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value))
                        return 'Must contain at least one special character';
                      return null;
                    },
                  ),
                ),
                Divider(color: Color(0xFF1C3347)),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _buildTextField(
                    passwordController,
                    'Password',
                    'Please enter your password',
                        (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your password';
                      if (value.length < 8)
                        return 'Must be at least 8 characters';
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value))
                        return 'Must contain at least one special character';
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDontHaveAccount() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an Account?",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xFFFFFFFF),
          ),
        ),
        SizedBox(height: 1),
        Text(
          'Sign up now!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Color(0xFF0A9EF3),
          ),
        ),
        _buildBlurredCircle(Colors.deepOrange),
        _buildBlurredCircle(Colors.deepOrange),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Forgotten Password?',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xFF0A9EF3),
          ),
        ),
      ],
    );
  }
}