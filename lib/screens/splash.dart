import 'package:flutter/material.dart';
import 'package:vixor_project/screens/localization/lang.dart';
import 'package:vixor_project/utils/app_imagse.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to main page or next screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Lang()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
            child: FadeTransition(
          // ignore: sized_box_for_whitespace
          opacity: _animation,
          child: const SizedBox(
            width: 250,
            child: Image(image: AssetImage(Assets.imagesLogo)),
          ),
        )));
  }
}
