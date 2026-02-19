import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/ui/screen/auth/sinIn_screen.dart';
import 'package:test_project/ui/util/assets_path.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SinInScreen()),
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
            placeholderBuilder: (context) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
