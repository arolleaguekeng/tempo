import 'package:flutter/material.dart';
import 'package:tempo/modules/onboardin/services/onboarding_service.dart';
import 'package:tempo/utils/constants.dart';

class LaunchScreen extends StatefulWidget {
  static var routeName = "/";

  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  void initState() {
    super.initState();
    context.goWelcomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/logo_dark.png",
                width: 200,
                height: 200,
              ),
              Image.asset(
                "assets/icons/TEMPO.png",
                width: 100,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
