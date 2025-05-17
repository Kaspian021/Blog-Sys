
import 'package:blog_sys/controller/login_controller.dart';
import 'package:get/get.dart';

class BindLoginScreen implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    
  }
}