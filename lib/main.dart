import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufs_field_agent/controllers/home_controller.dart';
import 'package:ufs_field_agent/controllers/login_controller.dart';
import 'package:ufs_field_agent/pages/home_page.dart';

import 'controllers/to_do_list_controller.dart';
import 'pages/change_password.dart';
import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'pages/to_do_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(ToDoListController());
    Get.put(HomeController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
