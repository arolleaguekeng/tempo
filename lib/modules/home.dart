import 'package:flutter/material.dart';
import 'package:tempo/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Let’s get you in",
            style: TextStyle(color: Colors.white, fontSize: 43),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              // var user = await AuthService.signInWithGoogle();
              // if (AuthService.auth.currentUser != null) {
              //   Navigator.pushNamed(context, '/home');
              // } else {
              //   errorDialog(context, "Impossible de se connecter");
              // }
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
