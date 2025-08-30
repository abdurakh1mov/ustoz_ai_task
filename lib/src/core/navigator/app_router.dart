import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/presentation/screens/auth/login_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final appRouter = GoRouter(
    initialLocation: "/login",
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) {
          return LoginScreen();
        },
      ),
    ],
  );
}
