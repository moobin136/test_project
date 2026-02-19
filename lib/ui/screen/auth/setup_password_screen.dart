import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_project/ui/screen/auth/sinIn_screen.dart';
import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class SetupPasswordScreen extends StatefulWidget {
  const SetupPasswordScreen({super.key});

  @override
  State<SetupPasswordScreen> createState() => _SetupPasswordScreenState();
}

class _SetupPasswordScreenState extends State<SetupPasswordScreen> {
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
                bottom: MediaQuery.of(context).viewInsets.bottom + 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                _buildHader(textThem),
                const SizedBox(height: 24),
                _buildSetupPassword(textThem),
                _buildForgotAndSinUp(textThem, context)
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
          'Set Password',
          style: textThem.displaySmall?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          'Minimum Six Despite Password insert and Splanchnic carter and small number and symbolise',
          style: textThem.titleSmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  void _onTapSignUp(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SinInScreen(),
        ),
        (_) => false);
  }

  void _onTapConform() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SinInScreen(),
        ),
        (_) => false);
  }

  Widget _buildForgotAndSinUp(TextTheme textThem, BuildContext context) {
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

  Widget _buildSetupPassword(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'New Password'),
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: InputDecoration(hintText: 'Conform Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onTapConform,
          child: Text(
            'Conform',
            style: textThem.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
