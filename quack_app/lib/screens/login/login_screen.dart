import 'package:flutter/material.dart';
import 'package:quack_app/core/auth.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/screens/loading/loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  void authenticate() async {
    String auth = await Auth().getAuth();
    if (auth != "") {
      // Try to auto login with saved creds
      bool isAuth = await Auth().authenticate(auth);
      if (isAuth) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingScreen(
              routeTo: "/home",
              waitOn: () async {
                MenuData().loadData();
                await Future.delayed(const Duration(seconds: 2), () {});
                return Future.value("");
              },
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    authenticate();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool formIsValidated = false;

  String? validateEmail(String? value) {
    if (value == null || value == "") {
      formIsValidated = false;
      return "* required";
    } else if (!value.contains("@emory.edu")) {
      formIsValidated = false;
      return "Enter a valid @emory.edu email!";
    }
    formIsValidated = true;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      formIsValidated = false;
      return "* required";
    } else if (value.length < 8) {
      formIsValidated = false;
      return "Password must be at least 8 characters";
    }

    formIsValidated = true;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
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
                      'Login',
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
                      hintText: 'Email',
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
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text.rich(
                            TextSpan(
                              text: ' Forgot Password',
                              style: TextStyle(color: Color(0xffEE7B23)),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () async {
                            if (validateEmail(emailController.text) != null ||
                                validatePassword(passwordController.text) !=
                                    null) {
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingScreen(
                                  routeTo: "/home",
                                  waitOn: () async {
                                    Auth().saveAuth(emailController.text,
                                        passwordController.text);
                                    MenuData().loadData();
                                    await Future.delayed(
                                        const Duration(seconds: 2), () {});
                                    return Future.value("");
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {},
                    child: const Text.rich(
                      TextSpan(text: 'Don\'t have an account?', children: [
                        TextSpan(
                          text: ' Sign Up',
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
