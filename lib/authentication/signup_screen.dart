import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kuliah_tpm/api_connection/api_connection.dart';
import 'package:kuliah_tpm/components/my_button.dart';
import 'package:kuliah_tpm/components/my_textfield.dart';
import 'package:kuliah_tpm/authentication/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      var data = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      bool success = await Api.addUser(data);

      if (success) {
        Get.snackbar(
          "Success",
          "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Future.delayed(const Duration(seconds: 2), () {
          Get.off(LoginScreen()); // Redirect to login screen
        });
      } else {
        Get.snackbar(
          "Error",
          "Failed to create account. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/1069.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              width: 350,
              height: 650,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildLabel('Nama'),
                        MyTextField(
                          controller: nameController,
                          hintText: 'Enter your name',
                          obscureText: false,
                        ),
                        const SizedBox(height: 14),
                        buildLabel('Email'),
                        MyTextField(
                          controller: emailController,
                          hintText: 'Enter your email',
                          obscureText: false,
                        ),
                        const SizedBox(height: 14),
                        buildLabel('Password'),
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 35),
                        MyButton(text: "SIGN UP", onTap: signUp),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun? ',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(LoginScreen()),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
