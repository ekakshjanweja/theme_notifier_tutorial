import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:theme_tut/theme/theme_notifier.dart";

class HomeCupertino extends StatelessWidget {
  const HomeCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeNotifier();

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Theme Notifier Example"),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder<ThemeMode>(
                  valueListenable: themeNotifier.themeModeNotifier,
                  builder: (context, mode, child) {
                    IconData icon;
                    String text;
                    switch (mode) {
                      case ThemeMode.light:
                        icon = CupertinoIcons.sun_max;
                        text = "Light Mode";
                        break;
                      case ThemeMode.dark:
                        icon = CupertinoIcons.moon;
                        text = "Dark Mode";
                        break;
                      case ThemeMode.system:
                        icon = CupertinoIcons.device_phone_portrait;
                        text = "System Mode";
                        break;
                    }

                    return Column(
                      children: [
                        Icon(
                          icon,
                          size: 100,
                          color: CupertinoTheme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          text,
                          style: CupertinoTheme.of(
                            context,
                          ).textTheme.navLargeTitleTextStyle,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  "Select Theme Mode:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    CupertinoButton.filled(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      onPressed: () =>
                          themeNotifier.saveThemeMode(ThemeMode.light),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.sun_max, size: 18),
                          SizedBox(width: 8),
                          Text("Light"),
                        ],
                      ),
                    ),
                    CupertinoButton.filled(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      onPressed: () =>
                          themeNotifier.saveThemeMode(ThemeMode.dark),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.moon, size: 18),
                          SizedBox(width: 8),
                          Text("Dark"),
                        ],
                      ),
                    ),
                    CupertinoButton.filled(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      onPressed: () =>
                          themeNotifier.saveThemeMode(ThemeMode.system),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.device_phone_portrait, size: 18),
                          SizedBox(width: 8),
                          Text("System"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  onPressed: () => themeNotifier.toggleTheme(),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: CupertinoColors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Toggle Light/Dark",
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
