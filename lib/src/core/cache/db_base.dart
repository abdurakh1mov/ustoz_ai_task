import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  static const _dbName = 'LOCAL_STORAGE_CACHE';
  static late final Box _dbBox;

  static Future<Box> ensureInitialized() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/custom_hive');

    _dbBox = await Hive.openBox(_dbName);
    return _dbBox;
  }

  Box get dbBox => _dbBox;
}
