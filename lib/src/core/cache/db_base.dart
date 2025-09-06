import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../injector/injector.dart';

class HiveBase {
  static const _dbName = 'LOCAL_STORAGE_CACHE';
  static late final Box _dbBox;
  Box get dbBox => _dbBox;
  static Future<Box> ensureInitialized() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/custom_hive');

    _dbBox = await Hive.openBox(_dbName);
    return _dbBox;
  }

  Future<void> deleteHiveBox() async {
    try {
      if (Hive.isBoxOpen(_dbName)) {
        await Hive.deleteBoxFromDisk(_dbName);
        Hive.openBox(_dbName);
      } else {
        printLog('Box not found or already deleted.');
      }
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (e) {
      printLog('Error deleting box: $e');
    }
  }
}
