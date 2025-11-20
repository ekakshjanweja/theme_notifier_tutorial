import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:theme_tut/home.dart";
import "package:theme_tut/home_cupertino.dart";
import "package:theme_tut/theme/theme_notifier.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeNotifier().themeModeNotifier,
      builder: (_, themeMode, _) {
        if (!kIsWeb && !kIsWasm && (Platform.isIOS || Platform.isMacOS)) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              brightness: themeMode == ThemeMode.dark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            home: const HomeCupertino(),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const Home(),
        );
      },
    );
  }
}
