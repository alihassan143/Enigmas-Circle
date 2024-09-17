import 'package:enimacircle/main_screen.dart';
import 'package:enimacircle/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/splash_video.mp4")
      ..initialize().then((vla) {
        setState(() {});
        controller.play();
        Future.delayed(const Duration(seconds: 10), () {
          NavigationService.replaceScreen(const MainScreen());
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : Container(),
      ),
    );
  }
}
