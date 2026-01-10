import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailC, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passC, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.login(emailC.text, passC.text);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
