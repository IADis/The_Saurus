import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/animated_button.dart';

import '../../components/error_dialog.dart';
import '../../components/rounded_button_style.dart';
import 'package:form_validators/form_validators.dart';

import 'controller/signin_controller.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool isValidated = signInState.status.isValidated;
    final signInController = ref.read(signInProvider.notifier);

    return AnimatedButton(
      onTap: () => isValidated
          ? signInController.signInWithEmailAndPassword()
          : ErrorDialog.show(context, 'Empty'),
      child: const RoundedButtonStyle(
        title: 'Sign In',
      ),
    );
  }
}
