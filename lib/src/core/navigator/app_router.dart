import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/core/navigator/router_names.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/create_transaction/create_transaction_bloc.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/login/login_cubit.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/profile/profile_cubit.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/login/login_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/login/reset_password_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/home_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/create_transaction_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/main_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/profile/edit_profile_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/profile/profile_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/statistics/statistics_screen.dart';
import 'package:ustoz_ai_task/src/splash_screen.dart';
import '../../data/model/transaction_model.dart';
import '../../presentation/blocs/sign_up/sign_up_cubit.dart';
import '../injector/injector.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: "/splash",
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RouterNames.login,
        name: RouterNames.login,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                LoginCubit(authRepository: getIt<AuthRepositoryInterface>()),
            child: LoginScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RouterNames.signUp,
            name: RouterNames.signUp,
            builder: (context, state) {
              return BlocProvider(
                create: (context) => SingUpBloc(
                  authRepository: getIt<AuthRepositoryInterface>(),
                ),
                child: SignUpScreen(),
              );
            },
          ),
          GoRoute(
            path: RouterNames.resetPassword,
            name: RouterNames.resetPassword,
            builder: (context, state) {
              final extras = state.extra;
              BuildContext? context;
              if (extras is Map<String, dynamic>) {
                context =
                    (state.extra != null && state.extra is Map<String, dynamic>)
                    ? (state.extra as Map<String, dynamic>)["context"]
                          as BuildContext
                    : null;
              }
              return BlocProvider.value(
                value: context!.read<LoginCubit>(),
                child: ResetPasswordScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: RouterNames.main,
        name: RouterNames.main,
        builder: (context, state) {
          return MainScreen();
        },
        routes: [
          GoRoute(
            path: RouterNames.home,
            name: RouterNames.home,
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: RouterNames.statistics,
            name: RouterNames.statistics,
            builder: (context, state) {
              return const StatisticsScreen();
            },
          ),
          GoRoute(
            path: RouterNames.profile,
            name: RouterNames.profile,
            builder: (context, state) {
              return const ProfileScreen();
            },
            routes: [
              GoRoute(
                path: RouterNames.editProfile,
                name: RouterNames.editProfile,
                builder: (contextRouter, state) {
                  final extras = state.extra;
                  BuildContext? context;
                  if (extras is Map<String, dynamic>) {
                    context =
                        (state.extra != null &&
                            state.extra is Map<String, dynamic>)
                        ? (state.extra as Map<String, dynamic>)["context"]
                              as BuildContext
                        : null;
                  }
                  return BlocProvider.value(
                    value: context!.read<ProfileCubit>(),
                    child: const EditProfileScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: RouterNames.createTransaction,
            name: RouterNames.createTransaction,
            builder: (context, state) {
              final extras = state.extra;
              final isEditable =
                  (extras is Map<String, dynamic> &&
                      extras['isEditable'] is bool)
                  ? extras['isEditable'] as bool
                  : false;

              final transaction = (isEditable)
                  ? extras['transaction'] as TransactionModel?
                  : null;
              return BlocProvider(
                create: (context) => CreateTransactionBloc(
                  repository: getIt<MainRepositoryInterface>(),
                )..add(const CreateTransactionEvent.fetchCategories()),
                child: CreateTransactionScreen(
                  isEditable: isEditable,
                  transaction: transaction,
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: RouterNames.splash,
        name: RouterNames.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );
}
