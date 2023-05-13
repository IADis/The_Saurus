import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'package:thesaurus/authentication/signup/controller/signup_controller.dart';
import 'package:thesaurus/components/loading_error.dart';

import '../../components/error_dialog.dart';
import 'button.dart';
import 'email.dart';
import 'name.dart';
import 'password.dart';

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(signUpProvider, ((previous, current) {
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
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: const [
              NameSignUp(),
              SizedBox(
                height: 10,
              ),
              EmailSignUp(),
              SizedBox(
                height: 10,
              ),
              PasswordSignUp(),
              SizedBox(
                height: 20,
              ),
              SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}
