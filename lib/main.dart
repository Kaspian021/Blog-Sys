

import 'package:blog_sys/controller/bindings.dart';
import 'package:blog_sys/controller/login_controller.dart';
import 'package:blog_sys/controller/route_controller/routs.dart';
import 'package:blog_sys/view/login_screen.dart';
import 'package:blog_sys/view/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    return GetMaterialApp(
      getPages: Routs.routs,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      theme: ThemeData(
        textTheme: TextTheme(

          bodyLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 22
          ),
          bodySmall: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 12
          ),
          titleLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16
          // ),
          // bodyLarge: TextStyle(
          //   fontFamily: 'Avenir',
          //   fontWeight: FontWeight.w700,
          //   color: Colors.black,
          //   fontSize: 24
          // ),
          // bodyLarge: TextStyle(
          //   fontFamily: 'Avenir',
          //   fontWeight: FontWeight.w700,
          //   color: Colors.black,
          //   fontSize: 24
          // ),
        )
      ),
      )
    );
  }
}


