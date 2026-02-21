import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/screen/auth/forgo_password_email_screen.dart';
import 'package:test_project/ui/screen/navbar_screen.dart';
import 'package:test_project/ui/screen/auth/sinUp_screen.dart';
import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class SinInScreen extends StatefulWidget {
  const SinInScreen({super.key});

  @override
  State<SinInScreen> createState() => _SinInScreenState();
}

class _SinInScreenState extends State<SinInScreen> {
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
              right: 24,
              left: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                _buildHader(textThem),
                const SizedBox(height: 24),
                _buildSinInForm(textThem),
                _buildForgotAndSinUp(textThem, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SinUpScreen(),
      ),
    );
  }

  void _onPressedLogIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => NavbarScreen(),
      ),
    );
  }

  void _onTapForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordEmailScreen(),
      ),
    );
  }

  Widget _buildHader(TextTheme textThem) {
    return Text(
      'Gate Stated With',
      style: textThem.displaySmall?.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Widget _buildForgotAndSinUp(TextTheme textThem, BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: _onTapForgotPassword,
            child: Text(
              'Forgot Password',
              style: textThem.bodySmall
                  ?.copyWith(color: const Color(0xFF6C6B6B), fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: 'Don\'n have an account ',
              style: textThem.bodyMedium?.copyWith(fontSize: 13),
              children: [
                TextSpan(
                  text: 'Sin Up',
                  style: textThem.bodyMedium?.copyWith(
                    color: AppColors.themColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _onTapSignUp(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSinInForm(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedLogIn,
          child: const Icon(
            Icons.arrow_circle_right_outlined,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
