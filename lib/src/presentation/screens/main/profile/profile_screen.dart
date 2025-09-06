import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/component/cached_image.dart';
import 'package:ustoz_ai_task/src/core/navigator/router_names.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/profile/profile_cubit.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/profile/widgets/profile_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ProfileAppBar(),
            ListTile(
              onTap: () {
                // context.pushNamed(
                //   RouterNames.editProfile,
                //   extra: {'context': context},
                // );
              },
              leading: CachedImage(
                height: 45.h,
                width: 50.w,
                isCircle: true,
                imageUrl: state.userData?.photoURL ?? "",
              ),
              title: Text(
                state.userData?.name ?? "No name",
                style: context.textStyles.w500f14,
              ),
              subtitle: Text(
                state.userData?.email ?? "Email not found",
                style: context.textStyles.w500f14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.appColors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
