import 'package:flutter/material.dart';
import 'package:to_do_app/screens/signin_screen.dart';
import 'package:to_do_app/screens/signup_screen.dart';
import 'package:to_do_app/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FEFE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Arka plan resmi
          Image.asset(
            'assests/images/penguen.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 800,
          ),
          SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome Back!\n",
                              style: TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black, // Yazı rengi
                              ),
                            ),
                            TextSpan(
                                text:
                                    "If you have an account sign in\nIf you are new please sign up for your amazing journey!",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Sign In',
                            onTap: SigninScreen(),
                            color: Color.fromARGB(255, 158, 177, 177),
                          ),
                        ),
                        Expanded(
                          child: WelcomeButton(
                            buttonText: 'Sign Up',
                            onTap: SignupScreen(),
                            color: Color(0xFF97E7E7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
