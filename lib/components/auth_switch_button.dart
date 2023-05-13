import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thesaurus/components/slide_fade_switcher.dart';

class AuthSwitchbutton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;
  const AuthSwitchbutton({
    Key? key,
    required this.showSignIn,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SlideFadeSwitcher(
              child: showSignIn
                  ? Text(
                      'Dont have acoount? Sign Up',
                      style: GoogleFonts.marcellus(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      key: const ValueKey('SignIn'),
                    )
                  : Text(
                      'Already have account? Sign In',
                      style: GoogleFonts.marcellus(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      key: const ValueKey('SignUp'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
