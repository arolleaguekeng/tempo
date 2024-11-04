import 'package:flutter/material.dart';
import 'package:tempo/modules/auth/services/firebase_auth.dart';
import 'package:tempo/modules/navigation.dart';
import 'package:tempo/utils/constants.dart';
import 'package:tempo/utils/message_dialogs.dart';

import '../components/custom_signin_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(color: white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Center(
              child: Image.asset(
                "assets/icons/logo_dark.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
          //=================googele========================================//
          SizedBox(
            height: 20,
          ),
          Text(
            "Let’s get you in",
            style: TextStyle(color: white, fontSize: 43),
          ),
          SizedBox(
            height: 50,
          ),
          CustomElevatedButton(
            imagePath: 'assets/icons/google.png',
            buttonText: 'Continue with Google',
            backgroundColor: darkTon3,
            borderColor: white,
            onPressed: () async {
              var user = await AuthService.signInWithGoogle();
              if (AuthService.auth.currentUser != null) {
                Navigator.pushNamed(context, '/home');
              } else {
                errorDialog(context, "Impossible de se connecter");
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          //=================apple========================================//
          CustomElevatedButton(
            imagePath: 'assets/icons/apple.png',
            buttonText: 'Continue with Apple',
            backgroundColor: darkTon3,
            borderColor: white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
          ),
        ],
      ),
    );
  }
}
