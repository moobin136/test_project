import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/screen/auth/pin_verfiaciton_screen.dart';
import 'package:test_project/ui/screen/auth/sinIn_screen.dart';
import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                _buildHader(textThem),
                const SizedBox(height: 24),
                _buildEmail(textThem),
                _buildHaveAccountSection(textThem)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHader(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Email Verification',
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

  void _onTapSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SinInScreen(),
      ),
    );
  }

  void _onPressedEmail() {
    //TODO : implements
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinVerificationScreen(),
      ),
    );
  }

  Widget _buildEmail(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedEmail,
          child: const Icon(
            Icons.arrow_circle_right_outlined,
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
