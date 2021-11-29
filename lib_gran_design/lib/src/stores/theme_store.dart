import 'package:flutter/material.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  late SharedPreferences _sharedPreferences;

  _ThemeStoreBase() {
    pipeline();
  }

  @observable
  ThemeMode themeMode = ThemeMode.system;

  Future<void> pipeline() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setThemeMode(await _loadThemeMode());
  }

  @action
  void setThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    _saveThemeMode(themeMode);
  }

  Future<bool> _saveThemeMode(ThemeMode themeMode) async {
    return _sharedPreferences.setInt('themeMode', themeMode.index);
  }

  Future<ThemeMode> _loadThemeMode() async {
    final int? themeModeIndex = _sharedPreferences.getInt('themeMode');
    if (themeModeIndex != null) {
      return ThemeMode.values[themeModeIndex];
    }
    return ThemeMode.system;
  }
}
