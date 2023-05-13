import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../components/text_input_fields.dart';
import 'controller/signup_controller.dart';

class NameSignUp extends ConsumerWidget {
  const NameSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showErrorName = signUpState.name.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: 'Name',
      errorText: showErrorName
          ? Name.showNameErrorMessage(signUpState.name.error)
          : null,
      onChanded: (name) => signUpController.onNameChange(name),
    );
  }
}
