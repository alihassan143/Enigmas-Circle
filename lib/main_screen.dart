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
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash.png"), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 2,
            ),
            Center(
              child: Image.asset(
                "assets/top.PNG",
                width: height * 0.3,
                height: height * 0.3,
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFb38728),
                      Color(0xFFfcf6ba),
                      Color(0xFFbf953f),
                      Color(0xFFfbf5b7),
                      Color(0xFFaa771c)
                    ])),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(width * 0.9, height * 0.05)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const MyHomePage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ),
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
              height: 40,
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
      ),
    );
  }
}
