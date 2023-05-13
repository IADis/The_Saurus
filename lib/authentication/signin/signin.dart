import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'package:thesaurus/authentication/signin/controller/signin_controller.dart';
import 'package:thesaurus/components/loading_error.dart';

import '../../components/error_dialog.dart';
import '../google_sign/google_signin_button.dart';
import 'button.dart';
import 'divider.dart';
import 'email.dart';
import 'password.dart';
import 'reset_password_button.dart';

class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(signInProvider, ((previous, current) {
      if (current.status.isSubmissionInProgress) {
        LoadingSheet.show(context);
      } else if (current.status.isSubmissionFailure) {
        Navigator.of(context).pop();
        ErrorDialog.show(context, '${current.errorMessage}');
      } else if (current.status.isSubmissionSuccess) {
        Navigator.of(context).pop();
      }
    }));
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: const [
              EmailSign(),
              SizedBox(
                height: 10,
              ),
              PasswordSignIn(),
              ResetPasswordButton(),
              SignInButton(),
              DividerOr(),
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
