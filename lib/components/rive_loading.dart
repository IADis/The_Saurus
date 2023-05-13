import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingRive extends StatelessWidget {
  const LoadingRive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RiveAnimation.asset('assets/rive/loading2.riv'),
    );
  }
}
