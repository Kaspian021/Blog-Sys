
import 'package:blog_sys/controller/bindings.dart';
import 'package:blog_sys/controller/route_controller/routs_name.dart';
import 'package:blog_sys/view/login_screen.dart';
import 'package:get/get.dart';

class Routs {

  Routs._();

  static List<GetPage<dynamic>> routs= [
        GetPage(name: RoutsName.routeLoginScreen, page: ()=>LoginScreen(),binding: BindLoginScreen() )
      ];

}