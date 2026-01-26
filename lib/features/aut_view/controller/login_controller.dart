import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/routes/routes.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive loading state
  final RxBool isLoading = false.obs;

  Future<void> loginApi() async {
    // Validation: empty fields
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email & Password are required');
      return;
    }

    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': emailController.text.trim(),
          'password': passwordController.text,
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.offNamed(AppRoutes.home);
        Get.snackbar('Login Success', 'Welcome!',);
      } else {
        Get.snackbar('Login Failed', data['error'] ?? 'Invalid credentials');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
