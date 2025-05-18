import 'package:blog_sys/controller/Animation_controller/login_animation_screen.dart';
import 'package:blog_sys/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.textStyle});

  final TextTheme textStyle;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<LoginController>();
  @override
  void initState() {
    //animationController
    LoginAnimationScreen.animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    LoginAnimationScreen.animationContainerLogin = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: LoginAnimationScreen.animationController,
        curve: Curves.elasticInOut,
      ),
    );

    LoginAnimationScreen.animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
        position: LoginAnimationScreen.animationContainerLogin,
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
                  () => Column(
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
                      SizedBox(height: 35),
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
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            Size(Get.width / 1.2, Get.height / 13.53),
                          ),
                        ),
                        child: Text(
                          'LOGIN',
                          style: widget.textStyle.titleLarge,
                        ),
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
                  ),
                );
              },
              animation: LoginAnimationScreen.animationController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    LoginAnimationScreen.animationController.dispose();
    super.deactivate();
  }
}
