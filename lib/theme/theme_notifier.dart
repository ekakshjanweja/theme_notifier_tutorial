import "package:flutter/material.dart";
import "package:theme_tut/local_storage/local_storage.dart";

class ThemeNotifier {
  static final ThemeNotifier _instance = ThemeNotifier._internal();
  factory ThemeNotifier() => _instance;

  ThemeNotifier._internal();

  final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(
    ThemeMode.system,
  );

  Future<void> loadThemeMode() async {
    final savedTheme = LocalStorage.get<String>(
      "theme_mode",
      defaultValue: "system",
    );

    if (savedTheme == null) {
      themeModeNotifier.value = ThemeMode.system;
      return;
    }

    if (savedTheme == ThemeMode.light.name) {
      themeModeNotifier.value = .light;
    } else if (savedTheme == ThemeMode.dark.name) {
      themeModeNotifier.value = .dark;
    } else {
      themeModeNotifier.value = .system;
    }
  }

  void toggleTheme() {
    if (themeModeNotifier.value == ThemeMode.light) {
      saveThemeMode(.dark);
    } else {
      saveThemeMode(.light);
    }
  }

  void saveThemeMode(ThemeMode mode) {
    themeModeNotifier.value = mode;
    LocalStorage.set("theme_mode", mode.name);
  }
}
