import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.config.dart';

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
