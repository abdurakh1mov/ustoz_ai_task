import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class SimpleBottomSheet extends StatelessWidget {
  const SimpleBottomSheet({
    super.key,
    required this.list,
    required this.onTap,
    required this.title,
  });
  final List<String> list;
  final String title;
  final void Function(String category) onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appColors.linear1,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: context.textStyles.w600f18,
              ).padding(EdgeInsets.only(left: 16.w, top: 12.h)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, color: context.appColors.white),
              ),
            ],
          ).padding(EdgeInsets.only(right: 10.w)),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    onTap(list[index]);
                    Navigator.of(context).pop();
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: context.appColors.white,
                  ),
                  title: Text(list[index], style: context.textStyles.w500f12),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
