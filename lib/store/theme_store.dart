import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'theme_store.g.dart';

enum ThemeType { light, dark }

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
  );
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  @observable
  ThemeType currentThemeType = ThemeType.light;

  @computed
  ThemeData get currentThemeData =>
      (currentThemeType == ThemeType.light) ? _lightTheme : _darkTheme;

  @computed
  String get currentThemeString =>
      (currentThemeType == ThemeType.light) ? "light" : "dark";

  @action
  void changeCurrentTheme(ThemeType type) {
    currentThemeType = type;
  }
}
