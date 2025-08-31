import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/core/navigator/router_names.dart';
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/login/login_bloc.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/login/login_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/home_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/main_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/profile/profile_screen.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/statistics/statistics_screen.dart';
import 'package:ustoz_ai_task/src/splash_screen.dart';

import '../../presentation/blocs/sign_up/sign_up_bloc.dart';
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
                LoginBloc(authRepository: getIt<AuthRepositoryInterface>()),
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
        ],
      ),
      GoRoute(
        path: RouterNames.main,
        name: RouterNames.main,
        builder: (context, state) {
          return const MainScreen();
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
