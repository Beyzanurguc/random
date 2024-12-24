import 'package:flutter/material.dart';
import 'package:to_do_app/screens/signup_screen.dart';
import 'package:to_do_app/screens/to_do.dart';
import 'package:to_do_app/widgets/custom_scaffold.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == userMail &&
          _passwordController.text == userPassword) {
        // Giriş başarılı olduğunda HomeScreen'e yönlendir
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ToDoAppPage(),
          ),
        );
      } else {
        // Hatalı e-posta veya şifre
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hatalı e-posta veya şifre.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 158, 177, 177),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: "Enter Email",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          hintText: "Enter password",
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _signIn,
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text("Don't have an account? Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
