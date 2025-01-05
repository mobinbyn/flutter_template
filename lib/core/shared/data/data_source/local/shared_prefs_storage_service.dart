import 'dart:async';

import 'package:flutter_template/core/shared/data/data_source/local/interface/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorageService implements StorageService {
  SharedPreferences? _sharedPreferences;

  final Completer<SharedPreferences> initCompleter = Completer<SharedPreferences>();

  @override
  void init() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => _sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    _sharedPreferences = await initCompleter.future;
    return _sharedPreferences!.get(key);
  }

  @override
  Future<void> clear() async {
    _sharedPreferences = await initCompleter.future;
    await _sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    _sharedPreferences = await initCompleter.future;
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    _sharedPreferences = await initCompleter.future;
    return await _sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, data) async {
    _sharedPreferences = await initCompleter.future;
    return await _sharedPreferences!.setString(key, data);
  }
}
