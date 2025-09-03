import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/core/extension/localisation_extension.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import '../../../../../generated/assets.gen.dart';
import '../../../../component/custom_password_text_field.dart';
import '../../../../component/custom_text_field.dart';
import '../../../../component/primary_button.dart';
import '../../../../component/screen.dart';
import '../../../../core/navigator/router_names.dart';
import '../../../../core/utils/decoration_helper.dart';
import '../../../blocs/login/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.pushReplacementNamed(RouterNames.main);
        }
      },
      child: Screen(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Row(
                    children: [
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
                            title: context.tr.login.toUpperCase(),
                            onPressed: () {
                              if (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty) {
                                return;
                              } else {
                                if (state.isLoading) {
                                  return;
                                }
                                context
                                    .read<LoginCubit>()
                                    .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                              }
                            },
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4.h),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.h),
                              onTap: () {
                                context.pushNamed(RouterNames.signUp);
                              },
                              child: Text(
                                context.tr.sign_up.toUpperCase(),
                                style: context.textStyles.w600f14,
                              ).padding(EdgeInsetsGeometry.all(4)),
                            ),
                          ).padding(EdgeInsets.only(top: 24.h)),

                          Column(
                            children: [
                              40.h.verticalSpace,
                              Text(
                                context.tr.continue_with_google,
                                style: context.textStyles.w500f12,
                              ),
                              10.h.verticalSpace,
                              SizedBox(
                                width: 40.w,
                                height: 40.h,
                                child: Material(
                                  shape: CircleBorder(),
                                  color: decorationColorWithAlpha(
                                    context: context,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (state.isLoading) {
                                        return;
                                      }
                                      context
                                          .read<LoginCubit>()
                                          .signInWithGoogle();
                                    },
                                    customBorder: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Assets.icons.google.svg(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
