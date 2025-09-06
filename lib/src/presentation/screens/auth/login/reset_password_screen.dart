import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/primary_button.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/extension/localisation_extension.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/login/login_cubit.dart';

import '../../../../component/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _focusNodeUserName = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onTextChanged);
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Screen(
          body: Column(
            children: [
              Row(
                children: [
                  BackButton(color: context.appColors.white),
                  const Spacer(),
                  Text(
                    context.tr.reset_password,
                    style: context.textStyles.w600f18,
                  ).padding(EdgeInsets.only(right: 40.w)),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      100.h.verticalSpace,
                      CustomTextField(
                        controller: _emailController,
                        focusNode: _focusNodeUserName,
                        hintText: context.tr.email,
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {
                    context.read<LoginCubit>().resetPassword(
                      email: _emailController.text,
                    );
                  }
                },
                isLoading: state.isResetLoading,
                title: context.tr.send,
                isDisabled: _emailController.text.isEmpty,
              ),
            ],
          ).padding(EdgeInsets.only(left: 16.w, right: 16.w, bottom: 40.h)),
        );
      },
    );
  }
}
