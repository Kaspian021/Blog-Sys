import 'package:blog_sys/controller/login_controller.dart';
import 'package:blog_sys/controller/route_controller/routs.dart';
import 'package:blog_sys/view/Screens/StartScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetMaterialApp(
      getPages: Routs.routs,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith((callback) {
              if (callback.contains(WidgetState.pressed)) {
                return Colors.black;
              }
              return Colors.blue;
            }),
            animationDuration: Duration(seconds: 1),
            shape: WidgetStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            
          ),
        ),
        
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 22,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 12,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
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
          ),
        ),
      ),
    );
  }
}
