
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  
  RxBool obscureTextBool = true.obs;
  RxBool username = false.obs;
  RxBool isEmailOk = false.obs;
  RxBool isPassportOk = false.obs;


  //Firebase_authentication
  final _firebaseAuth= FirebaseAuth.instance;

  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textEmailEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
  try {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(

      email: textEmailEditingController.text.trim(),
      password: textEmailEditingController.text.trim(),
    );
    final User? user = userCredential.user;
    if (user != null) {
      
      print('User signed up: ${user.uid}');
      
      

      if (!user.emailVerified) {
        await user.sendEmailVerification();
        Get.snackbar('Submit', "sendEmailVerification");
      }
     
    }
  } on FirebaseAuthException catch (e) {
    
    print('Error signing up: $e');
    
    switch (e.code) {
      case 'weak-password':
        Get.snackbar('Error', "weak-password");
        break;
      case 'email-already-in-use':
        Get.snackbar('Error', "email-already-in-use"); 
        break;
      case 'invalid-email':
        Get.snackbar('Error', "invalid-email"); 
        break;
      default:
        Get.snackbar('Error', "Error Authentication"); 
        break;
    }
    
  } catch (e) {
    print(e);
    
  }
  }
  

}