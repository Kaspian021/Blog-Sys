import 'package:blog_sys/controller/Animation_controller/login_animation_screen.dart';
import 'package:blog_sys/controller/login_controller.dart';
import 'package:blog_sys/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var loginController = Get.put(LoginController());
  RxBool loginSelect = true.obs;
  RxBool signUpSelect = false.obs;
  RxBool obscureTextBool = true.obs;

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 50),
            Image.asset(Assets.images.logoBlog.path, scale: 2.5), //Image_Logo
            SizedBox(height: 30),
            //container_Login
            Expanded(
              child: Container(
                height: Get.height / 1.2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 27, 211),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    //select_login||signUP
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Obx(
                        ()=> Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(!loginSelect.value && signUpSelect.value==true){
                                  loginSelect.value=true;
                                  signUpSelect.value=false;
                                }else{
                                  loginSelect.value=false;
                                }
                              },
                        
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w700,
                                  color:
                                      loginSelect.value
                                          ? Colors.white
                                          : Colors.white30,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if(!signUpSelect.value && loginSelect.value==true){
                                  signUpSelect.value=true;
                                  loginSelect.value=false;
                                }else{
                                  signUpSelect.value=false;
                                }
                              },
                              child: Text('SIGN UP', style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700,
                                    color:
                                        signUpSelect.value
                                            ? Colors.white
                                            : Colors.white30,
                                    fontSize: 16,
                                  ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    //login_screen|| SignUpScreen
                    Obx(
                      () => loginSelect.value? LoginScreenView(textStyle: textStyle, loginController: loginController, obscureTextBool: obscureTextBool):SignUpScreen(textStyle: textStyle, obscureTextBool: obscureTextBool,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({
    super.key,
    required this.textStyle,
    required this.loginController,
    required this.obscureTextBool,
  });

  final TextTheme textStyle;
  final LoginController loginController;
  final RxBool obscureTextBool;

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> with SingleTickerProviderStateMixin {
  
  //animationController
  

  @override
  void initState() {
    LoginAnimationScreen.animationController= AnimationController(vsync: this,duration: Duration(seconds: 1));
    LoginAnimationScreen.animationController.forward();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
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

            builder: (context,widgets) {
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
                    controller:
                        widget.loginController
                            .textLoginEditingController,
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
                    obscureText: widget.obscureTextBool.value,
                    style: widget.textStyle.titleSmall,
                    cursorHeight: 18,
                    cursorWidth: 1,
                    expands: false,
                    controller:
                        widget.loginController
                            .textSignUPEditingController,
                    decoration: InputDecoration(
                      labelStyle: widget.textStyle.titleMedium,
                      label: Text('Password'),
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      contentPadding: EdgeInsets.only(left: 2),
                      hintFadeDuration: Duration(seconds: 1),
                  
                      suffixIcon: InkWell(
                        onTap: () {
                          widget.obscureTextBool.value
                              ? widget.obscureTextBool.value = false
                              : widget.obscureTextBool.value = true;
                        },
                        child: Text(
                          widget.obscureTextBool.value ? 'show' : 'Hide',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                  
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateColor.resolveWith((
                            callback,
                          ) {
                            if (callback.contains(
                              WidgetState.pressed,
                            )) {
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
              );
            }, animation: LoginAnimationScreen.animationController,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    
    LoginAnimationScreen.animationController.dispose();

    super.dispose();
  }
}

class SignUpScreen extends StatefulWidget {
   SignUpScreen({
    super.key,
    required this.textStyle,
    required this.obscureTextBool,

  });
  final RxBool obscureTextBool;
  final textStyle;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>with SingleTickerProviderStateMixin {
  
  late AnimationController animationController;

  @override
  void initState() {
    animationController= AnimationController(vsync: this,duration: Duration(seconds: 1));
    animationController.forward();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
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

            builder: (context,widgets) {
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
                    // controller:
                    //     widget.loginController
                    //         .textLoginEditingController,
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
                    obscureText: widget.obscureTextBool.value,
                    style: widget.textStyle.titleSmall,
                    cursorHeight: 18,
                    cursorWidth: 1,
                    expands: false,
                    // controller:
                    //     widget.loginController
                    //         .textSignUPEditingController,
                    decoration: InputDecoration(
                      labelStyle: widget.textStyle.titleMedium,
                      label: Text('Password'),
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      contentPadding: EdgeInsets.only(left: 2),
                      hintFadeDuration: Duration(seconds: 1),
                  
                      suffixIcon: InkWell(
                        onTap: () {
                          widget.obscureTextBool.value
                              ? widget.obscureTextBool.value = false
                              : widget.obscureTextBool.value = true;
                        },
                        child: Text(
                          widget.obscureTextBool.value ? 'show' : 'Hide',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                  
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateColor.resolveWith((
                            callback,
                          ) {
                            if (callback.contains(
                              WidgetState.pressed,
                            )) {
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
              );
            }, animation: animationController,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    
    animationController.dispose();

    super.dispose();
  }
}
