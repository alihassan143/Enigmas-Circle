import 'package:enimacircle/home_screen.dart';
import 'package:enimacircle/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/card_video.mp4",
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((val) {
        setState(() {});
        controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Image.asset(
                "assets/top.png",
                width: height * 0.2,
                height: height * 0.2,
              ),
            ),
            const Spacer(),
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 20,
            ),
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
                      NavigationService.replaceScreen(const MyHomePage(
                          navigationLockUrl: "https://enigmascircle.com/",
                          openUrl: "https://enigmascircle.com/login"));
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
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.replaceScreen(const MyHomePage(
                        navigationLockUrl: "https://www.enigmaaviation.com/",
                        openUrl: "https://www.enigmaaviation.com"));
                  },
                  child: Image.asset(
                    "assets/left.PNG",
                    width: height * 0.2,
                    height: height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    NavigationService.replaceScreen(const MyHomePage(
                        navigationLockUrl: "https://www.enigmasvault.com/",
                        openUrl: "https://www.enigmasvault.com"));
                  },
                  child: Image.asset(
                    "assets/right.PNG",
                    width: height * 0.13,
                    height: height * 0.13,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
