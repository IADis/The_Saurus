import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/text_input_fields.dart';
import 'package:form_validators/form_validators.dart';

import 'controller/signin_controller.dart';

class EmailSign extends ConsumerWidget {
  const EmailSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.email.invalid;
    final signInController = ref.read(signInProvider.notifier);
    return TextInputField(
      hintText: 'Email',
      errorText: showError
          ? Email.showEmailErrorMessage(signInState.email.error)
          : null,
      onChanded: (email) => signInController.onEmailChange(email),
    );
  }
}
