import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/cache/db_service.dart';
import 'package:ustoz_ai_task/src/core/navigator/router_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && DbService().getAuthenticationStatus) {
        context.pushReplacementNamed(RouterNames.main);
      } else {
        if (mounted) {
          context.pushReplacementNamed(RouterNames.login);
        }
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Screen(
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
