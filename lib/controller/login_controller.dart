
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController = TextEditingController();

  RxBool loginSelect = true.obs;
  RxBool signUpSelect = false.obs;
  RxBool obscureTextBool = true.obs;
  
  

}