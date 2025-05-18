
import 'package:blog_sys/controller/bindings.dart';
import 'package:blog_sys/controller/route_controller/routs_name.dart';
import 'package:blog_sys/view/Screens/register&Login/select_register.dart';
import 'package:get/get.dart';

class Routs {

  Routs._();

  static List<GetPage<dynamic>> routs= [
        GetPage(name: RoutsName.routeLoginScreen, page: ()=>SelectRegister(),binding: BindLoginScreen() )
      ];

}