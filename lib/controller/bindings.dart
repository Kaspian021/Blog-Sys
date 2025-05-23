
import 'package:blog_sys/controller/Main_Screens/article_controller.dart';
import 'package:blog_sys/controller/Main_Screens/home_controller.dart';
import 'package:blog_sys/controller/Main_Screens/profile_controller.dart';
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
    Get.put(ArticleController());
    
  }
}

class BindArticleScreen implements Bindings{
  @override
  void dependencies() {
    
    Get.put(ArticleController());
    
  }
}

class BindProfileScreen implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController());
  }


}
