import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/features/aut_view/controller/login_controller.dart';
import 'package:test_project/routes/routes.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'Log In',
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Field
            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E-mail',
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),

            // Login Button with Loading
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed:
                      controller.isLoading.value ? null : controller.loginApi,
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text(
                          'Login Now',
                          style: TextStyle(fontSize: 20),
                        ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.home),
              child: const Text(
                'Skip Login (FaveIcon)',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.galleryAndCamera),
              child: const Text(
                'Camera & Gallery',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
