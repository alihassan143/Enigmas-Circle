import 'package:enimacircle/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Image.asset(
            "assets/top.PNG",
            width: height * 0.13,
            height: height * 0.13,
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(width * 0.9, height * 0.05)),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => const MyHomePage()),
                      (route) => false);
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.04, right: width * 0.04, top: height * 0.02),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  const TextSpan(
                      text:
                          "By continuing to access our services you are accepting our ",
                      style: TextStyle(fontSize: 14)),
                  TextSpan(
                      text: "Privacy Policy",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          final url = Uri.parse(
                              "https://enigmascircle.com/privacy-policy");
                          launchUrl(url);
                        },
                      style: const TextStyle(
                          fontSize: 14, decoration: TextDecoration.underline))
                ])),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/left.PNG",
                width: height * 0.13,
                height: height * 0.13,
              ),
              Image.asset(
                "assets/right.PNG",
                width: height * 0.13,
                height: height * 0.13,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          )
        ],
      ),
    );
  }
}
