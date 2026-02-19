import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/screen/sinIn_screen.dart';
import 'package:test_project/ui/screen/sinUp_screen.dart';
import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class SinUpScreen extends StatefulWidget {
  const SinUpScreen({super.key});

  @override
  State<SinUpScreen> createState() => _SinUpScreenState();
}

class _SinUpScreenState extends State<SinUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: SingleChildScrollView(
          reverse: true,
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
                _buildSinUpForm(textThem),
                const SizedBox(height: 32),
                _buildSinIn(textThem)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHader(TextTheme textThem) {
    return Text(
      'Join With Us',
      style: textThem.displaySmall?.copyWith(fontWeight: FontWeight.w500),
    );
  }

  void _onTapSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SinInScreen(),
      ),
    );
  }

  void _onPressedLogIn() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SinInScreen(),
      ),
      (_) => false,
    );
  }

  Widget _buildSinUpForm(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'First Name'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: 'Last Name'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(hintText: 'Mobile Number'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedLogIn,
          child: const Icon(
            Icons.arrow_circle_right_outlined,
          ),
        ),
      ],
    );
  }

  Widget _buildSinIn(TextTheme textThem) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: 'You have an account ? ',
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
