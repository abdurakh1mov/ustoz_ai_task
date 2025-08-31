import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.config.dart';

import '../../app.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  // getIt.registerLazySingleton(() => AppRouter());
}

void printLog(String message) {
  if (kDebugMode) {
    debugPrint(message);
  }
}

void showAppSnackBar(String message) {
  rootScaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}
