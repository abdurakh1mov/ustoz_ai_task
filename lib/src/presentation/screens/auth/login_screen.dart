import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login Screen', style: context.textStyles.w700f16),
      ),
    );
  }
}
