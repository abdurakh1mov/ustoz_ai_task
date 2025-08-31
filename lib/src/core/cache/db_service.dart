import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DbService {
  static const String _cacheKey = 'LOCAL_STORAGE_CACHE';
  static const String _isAuthenticatedKey = 'IS_AUTHENTICATED';
  static const String _uuid = 'UID';
  static const String _languageKey = 'LANGUAGE';
  static const String _isLanguageSelected = 'IS_LANGUAGE_SELECTED';

  final Box _box = Hive.box(_cacheKey);

  Future<void> saveIsLanguage(bool isLanguageSelected) async {
    await _box.put(_isLanguageSelected, isLanguageSelected);
  }

  bool get getLanguageStatus {
    return _box.get(_isLanguageSelected) ?? false;
  }

  Future<void> saveAuthenticationStatus(bool isAuthenticated) async {
    await _box.put(_isAuthenticatedKey, isAuthenticated);
  }

  bool get getAuthenticationStatus {
    return _box.get(_isAuthenticatedKey) ?? false;
  }

  Future<void> saveUid(String uid) async {
    await _box.put(_uuid, uid);
  }

  String? get getSessionId {
    return _box.get(_uuid);
  }

  Future<void> saveLanguage(String language) async {
    await _box.put(_languageKey, language);
  }

  String? get getLanguage {
    return _box.get(_languageKey);
  }
}
