import 'package:flutter/material.dart';
import 'package:test_project/ui/util/app_colors.dart';
import 'package:test_project/ui/widgets/screen_background.dart';

class SinInScreen extends StatelessWidget {
  const SinInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              _buildForm(textThem),
              Text(
                'Forgot Password',
                style: textThem.bodySmall
                    ?.copyWith(color: const Color(0xFF6C6B6B), fontSize: 14),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: 'Don\'n have an account ',
                  style: textThem.bodyMedium?.copyWith(fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'SinUp',
                      style: textThem.bodyMedium?.copyWith(
                        color: AppColors.themColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(TextTheme textThem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gate Stated With',
          style: textThem.displaySmall?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 24),
        TextFormField(
          decoration: InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.arrow_circle_right_outlined,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
