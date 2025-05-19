
import 'package:blog_sys/controller/Home/home_controller.dart';
import 'package:blog_sys/controller/Register/login_controller.dart';
import 'package:get/get.dart';

class BindLoginScreen implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    
  }
}

class BindHomeScreen implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    
  }
}