import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tempo/modules/auth/pages/Sign_in.dart';
import 'package:tempo/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentIndex = 0;

  final data = [
    {
      "image": "assets/images/Welcome.png",
      "desc": "From the latest to the greatest hits, play your favorite tracks on musium now!"
    },
    {
      "image": "assets/images/Welcome2.png",
      "desc": "Discover exclusive content and playlists curated just for you."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            items: data.map((e) {
              return Column(
                children: [
                  Image.asset(
                    e["image"]!,
                    fit: BoxFit.cover,
                  ),
                ],
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 1,
              height: MediaQuery.of(context).size.height,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 360,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                          children: [
                            const TextSpan(text: "From the "),
                            const TextSpan(
                              text: "latest ",
                              style: TextStyle(color: primaryColor),
                            ),
                            const TextSpan(text: "to the "),
                            const TextSpan(
                              text: "greatest ",
                              style: TextStyle(color: primaryColor),
                            ),
                            const TextSpan(text: "hits, play your favorite tracks onmusium now!"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 7,
                          decoration: BoxDecoration(
                            color: currentIndex == 0 ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),

                        Container(
                          width: 60,
                          height: 7,
                          decoration: BoxDecoration(
                            color: currentIndex == 1 ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                      },
                      child: const Text("Get Started"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
