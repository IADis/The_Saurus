import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../components/text_input_fields.dart';
import 'controller/signup_controller.dart';

class PasswordSignUp extends ConsumerWidget {
  const PasswordSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showErrorPassword = signUpState.password.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: 'Password',
      errorText: showErrorPassword
          ? Password.showPasswordErrorMessage(signUpState.password.error)
          : null,
      onChanded: (password) => signUpController.onPasswordChange(password),
    );
  }
}
