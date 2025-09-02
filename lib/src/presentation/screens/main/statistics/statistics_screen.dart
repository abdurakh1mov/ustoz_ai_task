import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Statistics Screen", style: context.textStyles.w700f18),
    );
  }
}
