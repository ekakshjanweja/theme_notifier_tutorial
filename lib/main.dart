import "package:flutter/material.dart";
import "package:theme_tut/app.dart";
import "package:theme_tut/local_storage/local_storage.dart";
import "package:theme_tut/theme/theme_notifier.dart";

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootStrap();
  runApp(const App());
}

Future<void> bootStrap() async {
  await LocalStorage.init();
  await ThemeNotifier().loadThemeMode();
}
