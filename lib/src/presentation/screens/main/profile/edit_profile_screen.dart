import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/cached_image.dart';
import 'package:ustoz_ai_task/src/component/custom_text_field.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/profile/profile_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusNodeUserName = FocusNode();

  final FocusNode _focusNodePassword = FocusNode();

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_onTextChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onTextChanged() => setState(() {});

  void _onPasswordChanged() => setState(() {});

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Screen(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(color: context.appColors.white),
                  const Spacer(),
                  Text(
                    "Edit Profile",
                    style: context.textStyles.w600f18,
                  ).padding(EdgeInsets.only(right: 40.w)),
                  const Spacer(),
                ],
              ),
              40.h.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: CachedImage(
                  imageUrl: state.userData?.photoURL ?? "",
                  width: 100.w,
                  height: 90.h,
                  isCircle: true,
                ),
              ),
              24.h.verticalSpace,
              Text("Full Name", style: context.textStyles.w600f16),
              8.h.verticalSpace,
              CustomTextField(
                controller: _fullNameController,
                focusNode: _focusNodeUserName,
                hintText: "Enter full name",
              ),
              16.h.verticalSpace,
              Text("Full Name", style: context.textStyles.w600f16),
              8.h.verticalSpace,
              CustomTextField(
                controller: _passwordController,
                focusNode: _focusNodePassword,
                hintText: "Enter password",
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16.w)),
        );
      },
    );
  }
}
