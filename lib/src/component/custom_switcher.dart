import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({super.key, required this.onToggle});
  final void Function(bool isUsd) onToggle;
  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  bool isUsd = false;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final appColors = context.appColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20.w,
          height: 20.h,
          child: Switch(
            activeThumbColor: appColors.softBlue,
            activeTrackColor: appColors.white,
            inactiveThumbColor: appColors.silverGray,
            inactiveTrackColor: appColors.white,
            trackOutlineColor: WidgetStateProperty.all(appColors.white),
            value: isUsd,
            onChanged: (newValue) {
              isUsd = newValue;
              widget.onToggle(newValue);
              setState(() {});
            },
          ),
        ),
        20.w.horizontalSpace,
        Text("USD", style: textStyles.w500f12),
      ],
    );
  }
}
