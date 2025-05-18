
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  
  RxBool obscureTextBool = true.obs;
  RxBool username = false.obs;
  RxBool isEmailOk = false.obs;
  RxBool isPassportOk = false.obs;

  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textEmailEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController = TextEditingController();

}