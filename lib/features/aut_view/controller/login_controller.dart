import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:test_project/routes/routes.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive loading state
  final RxBool isLoading = false.obs;

  Future<void> loginApi() async {
    // Validation: empty fields
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email & Password are required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      isLoading.value = true;

      final response = await post(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          // Map কে JSON string-এ কনভার্ট করা হয়েছে
          "email": emailController.text.trim(),
          "password": passwordController.text,
        }),
      );

      final data = jsonDecode(response.body);
      print('Status Code: ${response.statusCode}');
      print('Response Body: $data');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success: access_token পাওয়া গেছে
        final accessToken = data['access_token'];
        print('✅✅✅✅======================>>>>>>>>>> $accessToken ✅✅✅✅');
        // এখানে চাইলে token save করতে পারো (shared_preferences দিয়ে)
        // উদাহরণ: await SharedPreferences.getInstance().then((prefs) => prefs.setString('token', accessToken));

        Get.toNamed(AppRoutes.home);
        Get.snackbar(
          'Login Success',
          'Welcome!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        // Error response
        final errorMessage = data['message'] ?? 'Invalid credentials';
        Get.snackbar('Login Failed', errorMessage,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.',
          backgroundColor: Colors.red, colorText: Colors.white);
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
