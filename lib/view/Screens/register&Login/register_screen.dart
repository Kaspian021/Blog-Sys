

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
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome back',
                        style: widget.textStyle.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign in with your account',
                        style: widget.textStyle.bodySmall,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: widget.textStyle.titleSmall,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      expands: false,
                      controller: controller.textUserNameEditingController,
                      decoration: InputDecoration(
                        labelStyle: widget.textStyle.titleMedium,
                        label: Text('Username'),
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        contentPadding: EdgeInsets.only(left: 2),
                        hintFadeDuration: Duration(seconds: 1),
                      ),
                    ),
                    SizedBox(height: 35),
                    TextField(
                      obscureText: controller.obscureTextBool.value,
                      style: widget.textStyle.titleSmall,
                      cursorHeight: 18,
                      cursorWidth: 1,
                      expands: false,
                      controller: controller.textPasswordUPEditingController,
                      decoration: InputDecoration(
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
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
        
                      style: ButtonStyle(
                        backgroundColor: WidgetStateColor.resolveWith((callback) {
                          if (callback.contains(WidgetState.pressed)) {
                            return Colors.black;
                          }
                          return Colors.blue;
                        }),
                        animationDuration: Duration(seconds: 1),
                        shape: WidgetStatePropertyAll(
                          ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        fixedSize: WidgetStatePropertyAll(
                          Size(Get.width / 1.2, Get.height / 13.53),
                        ),
                      ),
                      child: Text('LOGIN', style: widget.textStyle.titleLarge),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Forgot your password?'),
                        SizedBox(width: 10),
                        Text('Reset here'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Or sign in with'),
                  ],
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
