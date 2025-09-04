import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.onYes,
    this.title = "Are you sure?",
    this.description = "You want to delete this transaction?",
  });
  final void Function() onYes;
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.appColors.linear1,
      title: Icon(Icons.warning_amber_outlined, color: context.appColors.white),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("No", style: context.textStyles.w500f14),
        ),
        TextButton(
          onPressed: () {
            onYes();
            Navigator.pop(context);
          },
          child: Text("Yes", style: context.textStyles.w500f14),
        ),
      ],
      icon: Text(title!, style: context.textStyles.w400f14),
      content: Text(
        description!,
        textAlign: TextAlign.center,
        style: context.textStyles.w500f16,
      ),
    );
    // }
  }
}
