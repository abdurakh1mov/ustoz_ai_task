import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/generated/assets.gen.dart';
import 'package:ustoz_ai_task/src/component/warning_dialog.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/profile/profile_cubit.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          "Profile",
          style: context.textStyles.w700f20,
        ).padding(EdgeInsets.only(left: 50.w)),
        const Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return WarningDialog(
                  onYes: () {
                    context.read<ProfileCubit>().logout(context: context);
                    Navigator.pop(dialogContext);
                  },
                );
              },
            );
          },
          icon: Assets.icons.logout.svg(
            colorFilter: ColorFilter.mode(
              context.appColors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
