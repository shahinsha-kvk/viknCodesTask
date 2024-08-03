import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';
import 'views/dashboard_screen.dart';
import 'views/sale_list_page.dart';
import 'views/profile_page.dart';
import 'views/filter_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'vikncodes',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/sale-list', page: () => SaleListPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/filter', page: () => FilterPage()),
      ],
    );
  }
}
