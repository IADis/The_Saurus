import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/loading_error.dart';

import 'controller/google.signin_controller.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<GoogleSignInState>(
      googleSignInProvider,
      (previous, current) {
        if (current == GoogleSignInState.loading) {
          LoadingSheet.show(context);
          // showDialog(
          //   context: context,
          //   builder: (_) => const SimpleDialog(
          //     title: Padding(
          //       padding: EdgeInsets.all(32.0),
          //       child: Text("Loading..."),
          //     ),
          //   ),
          // );
        } else if (current == GoogleSignInState.error) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Google signin failed"),
            ),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
    );

    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In With Google",
            style: GoogleFonts.marcellus(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      onPressed: () {
        ref.read(googleSignInProvider.notifier).signInWithGoogle();
      },
    );
  }
}
