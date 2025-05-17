
import 'package:blog_sys/gen/assets.gen.dart';
import 'package:blog_sys/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{


  late AnimationController controller;
  late Animation<double> animationLogo;

    @override
  void initState() {
    controller= AnimationController(vsync: this,duration: Duration(seconds: 1));

    animationLogo = Tween<double>(begin: .8, end:.7 ).animate(controller);

    controller.repeat();

    Future.delayed(Duration(seconds: 3)).then((onValue){

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> OnboardingScreen() ));

    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    
          children: [
            SizedBox(height: 10),
            ScaleTransition(scale: animationLogo,
            child: Center(child: Image.asset(Assets.images.logoBlog.path))),
    
            Align(
              alignment: Alignment.bottomCenter,
              child: SpinKitThreeInOut(color: Colors.blue, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}