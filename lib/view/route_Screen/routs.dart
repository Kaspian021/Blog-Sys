import 'package:blog_sys/controller/Main_Screens/home_controller.dart';
import 'package:blog_sys/controller/bindings.dart';
import 'package:blog_sys/view/Screens/Main_Screens/Home/home_screen.dart';
import 'package:blog_sys/view/Screens/Main_Screens/profile_screen.dart';
import 'package:blog_sys/view/Screens/StartScreens/splash_screen.dart';
import 'package:blog_sys/view/route_Screen/routs_name.dart';
import 'package:blog_sys/view/Screens/register&Login/select_register.dart';
import 'package:get/get.dart';

//Screens_for_simple_binding


class Routs {
  Routs._();

  static List<GetPage<dynamic>> routs = [
    GetPage(
      name: RoutsName.routeLoginScreen,
      page: () => const SelectRegister(),
      binding: BindLoginScreen(),
    ),
    GetPage(
      name: RoutsName.routeLoginScreen,
      page: () => const SelectRegister(),
      binding: BindLoginScreen(),
    ),
    GetPage(
      name: RoutsName.routeSplashScreen,
      page: () => const SplashScreen(),
      binding: BindLoginScreen(),
    ),
    GetPage(
      name: RoutsName.routeHomeScreen,
      page: () =>  HomeScreen(),
      binding: BindHomeScreen(),
    ),
    GetPage(
      name: RoutsName.routeProfileScreen,
      page: () =>  ProfileScreen(),
      binding: BindProfileScreen(),
    ),
  ];
}
