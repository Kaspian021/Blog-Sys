
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  RxBool loginSelect = true.obs;
  RxBool signUpSelect = false.obs;
  RxBool obscureTextBool = true.obs;
  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController = TextEditingController();

}