

import 'package:blog_sys/controller/Animation_controller/signup_animation_screen.dart';
import 'package:blog_sys/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.textStyle,

  });
  final textStyle;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  
  
  final controller= Get.find<RegisterController>();

  @override
  void initState() {
    SignUpAnimationScreen.animationController=AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    SignUpAnimationScreen.animationController.forward();

    SignUpAnimationScreen.animationContainerSignUp = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: SignUpAnimationScreen.animationController,
        curve: Curves.elasticInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
        position: SignUpAnimationScreen.animationContainerSignUp,
        child: Container(
          width: double.infinity,
          height: Get.height / 2.16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: AnimatedBuilder(
              builder: (context, widgets) {
                return Obx(
                  ()=> Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Create an account',
                          style: widget.textStyle.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up with your Email',
                          style: widget.textStyle.bodySmall,
                        ),
                      ),
                      SizedBox(height: 16),
                      //Username
                      TextField(
                        onChanged: (value) {
                          if(value.isNotEmpty){
                            controller.username.value=true;
                          }else{
                            controller.username.value=false;
                          }
                        },
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textUserNameEditingController,
                        decoration: InputDecoration(
                          icon: controller.username.value? Icon(Icons.check,color: Colors.green,) :Icon(Icons.person),
                          labelStyle: widget.textStyle.titleMedium,
                          label: Text('Username'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: EdgeInsets.only(left: 2),
                          hintFadeDuration: Duration(seconds: 1),
                        ),
                      ),
                      SizedBox(height: 20),
                      //Email
                      TextField(
                        onChanged: (value) {
                          
                          if(value.isEmail){

                            controller.isEmailOk.value=true;
                          }else{
                            controller.isEmailOk.value=false;
                          }

                        },
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textEmailEditingController,
                        decoration: InputDecoration(
                          icon: controller.isEmailOk.value? Icon(Icons.check,color: Colors.green,): Icon(Icons.email),
                          labelStyle: widget.textStyle.titleMedium,
                          label: Text('Email'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: EdgeInsets.only(left: 2),
                          hintFadeDuration: Duration(seconds: 1),
                        ),
                      ),
                      SizedBox(height: 20),
                      //password
                      TextField(
                        onChanged: (value) {
                          
                          if(value.isPassport){

                            controller.isPassportOk.value=true;
                          }else{
                            controller.isPassportOk.value=false;
                          }

                        },
                        
                        obscureText: controller.obscureTextBool.value,
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textPasswordUPEditingController,
                        decoration: InputDecoration(
                          icon: controller.isPassportOk.value? Icon(Icons.check,color: Colors.green,): Icon(Icons.lock),
                          labelStyle: widget.textStyle.titleMedium,
                          label: Text('Password'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: EdgeInsets.only(left: 2),
                          hintFadeDuration: Duration(seconds: 1),
                          
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.obscureTextBool.value
                                  ? controller.obscureTextBool.value = false
                                  : controller.obscureTextBool.value = true;
                            },
                            child: Text(
                              controller.obscureTextBool.value ? 'show' : 'Hide',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      //Submit_Button
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            Size(Get.width / 1.2, Get.height / 13.53),
                          ),
                        ),
                        onPressed: () {

                          //create_account
                          controller.signUpWithEmailAndPassword();
                        },
                        child: Text('CREATE', style: widget.textStyle.titleLarge),
                      ),
                      
                      
                      SizedBox(height: 30),
                      Text('Or sign in with'),
                      Row(
                        children: [

                        ],
                      )
                    ],
                  ),
                );
              },
              animation: SignUpAnimationScreen.animationController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SignUpAnimationScreen.animationController.dispose();

    super.dispose();
  }
}
