import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/ui/screen/sinIn_screen.dart';
import 'package:test_project/ui/util/assets_path.dart';

import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  ///init state
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SinInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetsPath.logoSVG,
            width: 140,
          ),
        ),
      ),
    );
  }
}
