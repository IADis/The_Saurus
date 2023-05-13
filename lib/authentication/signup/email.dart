import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../components/text_input_fields.dart';
import 'controller/signup_controller.dart';

class EmailSignUp extends ConsumerWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showErrorEmail = signUpState.email.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: 'Email',
      errorText: showErrorEmail
          ? Email.showEmailErrorMessage(signUpState.email.error)
          : null,
      onChanded: (email) => signUpController.onEmailChange(email),
    );
  }
}
