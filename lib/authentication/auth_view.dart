import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:thesaurus/components/slide_fade_switcher.dart';

import '../components/auth_switch_button.dart';
import 'signin/signin.dart';
import 'signup/signup.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _showSignIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/font.jpg',
            ),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 400),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 0.1,
                      sigmaY: 0.1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: Text(
                        _showSignIn ? 'Welcome' : 'Create account',
                        style: GoogleFonts.cinzel(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 25, right: 25),
              child: SlideFadeSwitcher(
                child: _showSignIn ? const SignIn() : const SignUp(),
              ),
            ),
            // const AnimatedShape(
            //   color: Colors.red,
            //   show: true,
            //   title: 'Create account',
            // ),
            // AnimatedShape(
            //   color: Colors.green,
            //   show: !_showSignIn,
            //   title: 'Welcome back',
            // ),
            AuthSwitchbutton(
              showSignIn: _showSignIn,
              onTap: () {
                setState(
                  () {
                    _showSignIn = !_showSignIn;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
