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
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (!emailController.text.endsWith("@gmail.com")) {
      Get.snackbar(
        "Invalid Email",
        "Please enter a valid @gmail.com email address.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

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
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
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
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
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
                        Center(child: MyButton(text: "SIGN UP", onTap: signUp)),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
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
                                onTap: () => Get.to(() => LoginScreen()),
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
