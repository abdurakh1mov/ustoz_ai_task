import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class ContainerTabBar extends StatefulWidget {
  const ContainerTabBar({super.key, required this.onTap});
  final void Function(int) onTap;
  @override
  State<ContainerTabBar> createState() => _ContainerTabBarState();
}

class _ContainerTabBarState extends State<ContainerTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      widget.onTap(_tabController.index);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textStyles = context.textStyles;
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: appColors.white.withValues(alpha: 0.2)),
      ),
      child: TabBar(
        tabAlignment: TabAlignment.fill,
        controller: _tabController,
        dividerColor: Colors.transparent,
        tabs: [
          Text("Income", style: textStyles.w600f12),
          Text('Expense', style: textStyles.w600f12),
        ],
        indicator: ContainerTabIndicator(
          width: (1.sw / 2),
          height: 32.h,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          borderWidth: 1,
          borderColor: appColors.white,
          radius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}
