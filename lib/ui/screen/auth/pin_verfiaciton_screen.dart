import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test_project/ui/screen/setup_password_screen.dart';

import 'package:test_project/ui/screen/sinIn_screen.dart';

import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                _buildHader(textThem),
                const SizedBox(height: 24),
                _buildPinPu(textThem),
                _buildHaveAccountSection(textThem)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SinInScreen(),
      ),
      (_) => false,
    );
  }

  void _onPressedVerify() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetupPasswordScreen(),
      ),
    );
  }

  Widget _buildHader(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PIN Verification',
          style: textThem.displaySmall?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          'A 6 Digit Verification send your email address Please check your email',
          style: textThem.titleSmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPinPu(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pinput(
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          keyboardType: TextInputType.number,
          defaultPinTheme: PinTheme(
            height: 50,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                shape: BoxShape.rectangle),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedVerify,
          child: Text(
            'Verify',
            style: textThem.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildHaveAccountSection(TextTheme textThem) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Have an account ? ',
              style: textThem.bodyMedium?.copyWith(fontSize: 13),
              children: [
                TextSpan(
                  text: 'Sin In',
                  style: textThem.bodyMedium?.copyWith(
                    color: AppColors.themColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
