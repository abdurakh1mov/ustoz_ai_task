import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Profile Screen",style: context.textStyles.w700f18));
  }
}
