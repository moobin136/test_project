import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/features/aut_view/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text('Log IN',
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController.value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'E-mail',
                    labelText: "E-mail"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    labelText: "Password"),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 0,
                        foregroundColor: Colors.white,
                        // fixedSize: Size(double.infinity, 26)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      controller.loginApi();
                      print('Login Now');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
