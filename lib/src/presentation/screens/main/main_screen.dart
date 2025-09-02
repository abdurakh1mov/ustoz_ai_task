import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/core/extension/localisation_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/home_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/profile/profile_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/statistics/statistics_screen.dart';

import '../../../../generated/assets.gen.dart';
import '../../../component/animation_button_effect.dart';
import '../../../component/screen.dart';
import '../../../core/navigator/router_names.dart';
import '../../blocs/main/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _screens = const [HomeScreen(), StatisticsScreen(), ProfileScreen()];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Screen(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _screens,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _bottomNavigationBar(context),
                ),
                Positioned(
                  right: 16.w,
                  bottom: 100.h,
                  child: AnimationButtonEffect(
                    disabled: false,
                    onTap: () {
                      context.pushNamed(
                        RouterNames.createTransaction,
                        extra: state.categories,
                      );
                    },
                    isLoading: false,
                    child: Container(
                      height: 56.h,
                      width: 56.h,
                      decoration: BoxDecoration(
                        color: context.appColors.softBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: context.appColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    final appColors = context.appColors;
    final textStyles = context.textStyles;
    final tr = context.tr;
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, left: 12.w, right: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 70.h,
            color: Colors.white.withValues(alpha: 0.2),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (index) => _onTabTapped(index),
                selectedItemColor: appColors.softBlue,
                unselectedItemColor: appColors.white,
                unselectedIconTheme: IconThemeData(
                  color: appColors.white,
                  size: 20.h,
                ),
                selectedIconTheme: IconThemeData(
                  color: appColors.softBlue,
                  size: 20.h,
                ),
                selectedLabelStyle: textStyles.w400f12,
                unselectedLabelStyle: textStyles.w400f12,
                items: [
                  _bottomBarItemBuilder(
                    tr.home,
                    Assets.icons.home.path,
                    context,
                  ),
                  _bottomBarItemBuilder(
                    tr.statistics,
                    Assets.icons.save.path,
                    context,
                  ),
                  _bottomBarItemBuilder(
                    tr.profile,
                    Assets.icons.profile.path,
                    context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomBarItemBuilder(
    String label,
    String path,
    BuildContext context,
  ) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      icon: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: SvgPicture.asset(
          path,
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(
            context.appColors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 6.h),
        child: SvgPicture.asset(
          path,
          width: 20.w,
          height: 20.h,
          colorFilter: ColorFilter.mode(
            context.appColors.softBlue,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
