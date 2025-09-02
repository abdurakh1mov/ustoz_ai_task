import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/data/model/category_model.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({
    super.key,
    required this.categories,
    required this.onTap,
  });
  final List<CategoryModel> categories;
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
          Text(
            "Categories",
            style: context.textStyles.w600f18,
          ).padding(EdgeInsets.only(left: 16.w, top: 12.h)),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    onTap(categories[index].title);
                    Navigator.of(context).pop();
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: context.appColors.white,
                  ),
                  title: Text(
                    categories[index].title,
                    style: context.textStyles.w500f12,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
