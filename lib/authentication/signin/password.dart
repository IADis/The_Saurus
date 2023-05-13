import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/text_input_fields.dart';

import 'package:form_validators/form_validators.dart';

import 'controller/signin_controller.dart';

class PasswordSignIn extends ConsumerStatefulWidget {
  const PasswordSignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<PasswordSignIn> createState() => _PasswordSignInState();
}

class _PasswordSignInState extends ConsumerState<PasswordSignIn> {
  bool obsure = true;
  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.password.invalid;
    final signInController = ref.read(signInProvider.notifier);

    return TextInputField(
      obscureText: obsure,
      hintText: 'Password',
      suffixIcon: IconButton(
        icon: Icon(obsure ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            obsure = !obsure;
          });
        },
      ),
      errorText: showError
          ? Password.showPasswordErrorMessage(signInState.password.error)
          : null,
      onChanded: (password) => signInController.onPasswordChange(password),
    );
  }
}
