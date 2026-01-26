import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:test_project/routes/routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Future loginApi() async {
    try {
      final responseCode =
          await post(Uri.parse('https://reqres.in/api/app-users/login'), body: {
        'email': emailController.value.text,
        'project_id': passwordController.value.text
      });

      var data = jsonDecode(responseCode.body);
      print(responseCode.statusCode);
      print(data);
      if (responseCode.statusCode == 200) {
        Get.toNamed(AppRoutes.home);
        Get.snackbar('Login Success Full', 'Success');
      } else {
        Get.snackbar('Login Field', 'data error');
      }
    } catch (e) {
      Get.snackbar('Exaction', e.toString());
    }
  }
}
