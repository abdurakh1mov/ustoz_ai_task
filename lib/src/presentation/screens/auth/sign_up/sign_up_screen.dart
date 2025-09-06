import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/core/extension/localisation_extension.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/sign_up/sign_up_cubit.dart';
import '../../../../component/custom_password_text_field.dart';
import '../../../../component/custom_text_field.dart';
import '../../../../component/primary_button.dart';
import '../../../../component/screen.dart';
import '../../../../core/navigator/router_names.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusNodeUserName = FocusNode();

  final FocusNode _focusNodePassword = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onTextChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onTextChanged() => setState(() {});

  void _onPasswordChanged() => setState(() {});

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.pushReplacementNamed(RouterNames.main);
        }
      },
      child: BlocBuilder<SingUpBloc, SignUpState>(
        builder: (context, state) {
          return Screen(
            body: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: BackButton(color: context.appColors.white),
                      ),
                      Text(
                        context.tr.sign_up,
                        style: context.textStyles.w700f24,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          150.h.verticalSpace,
                          CustomTextField(
                            controller: _emailController,
                            focusNode: _focusNodeUserName,
                            hintText: context.tr.email,
                          ),
                          16.h.verticalSpace,
                          CustomPasswordTextField(
                            controller: _passwordController,
                            focusNode: _focusNodePassword,
                            hintText: context.tr.password,
                          ),
                          if (state.errorMessage != "")
                            Text(
                              state.errorMessage,
                              style: context.textStyles.w600f14.copyWith(
                                color: context.appColors.red,
                              ),
                            ).padding(EdgeInsets.only(top: 12.h)),
                          24.h.verticalSpace,
                          PrimaryButton(
                            isLoading: state.isLoading,
                            isDisabled:
                                _emailController.text.isEmpty ||
                                _passwordController.text.isEmpty,
                            title: context.tr.sign_up.toUpperCase(),
                            onPressed: () {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                return;
                              } else {
                                if (state.isLoading) {
                                  return;
                                }
                                context
                                    .read<SingUpBloc>()
                                    .registerWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
