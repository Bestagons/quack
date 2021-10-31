import 'package:flutter/material.dart';

import 'package:quack_app/screens/loading/loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value == "") {
      return "* required";
    } else if (!value.contains("@emory.edu")) {
      return "Enter a valid @emory.edu email!";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "* required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Passwords do not match";
    }

    return validatePassword(value);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                height: height * 0.30,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: width * 0.9,
                child: Column(children: [
                  Row(children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ]),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      hintText: 'Emory Email',
                      suffixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    validator: validatePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    validator: validateConfirmPassword,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: const Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            child: const Text('Sign Up'),
                            onPressed: () async {
                              if (validateEmail(emailController.text) != null ||
                                  validatePassword(passwordController.text) !=
                                      null ||
                                  validateConfirmPassword(
                                          confirmPasswordController.text) !=
                                      null) {
                                return;
                              }

                              // TODO: Register account and do email verification here

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoadingScreen(
                                    routeTo: "/login",
                                    waitOn: () async {
                                      await Future.delayed(
                                          const Duration(seconds: 2), () {});
                                      return Future.value("");
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text.rich(
                      TextSpan(text: 'Already have an account?', children: [
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(color: Color(0xffEE7B23)),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
