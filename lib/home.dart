import "package:flutter/material.dart";
import "package:theme_tut/theme/theme_notifier.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeNotifier();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Notifier Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const .all(24.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              ValueListenableBuilder<ThemeMode>(
                valueListenable: themeNotifier.themeModeNotifier,
                builder: (context, mode, child) {
                  IconData icon;
                  String text;
                  switch (mode) {
                    case .light:
                      icon = Icons.wb_sunny;
                      text = "Light Mode";
                      break;
                    case .dark:
                      icon = Icons.nightlight_round;
                      text = "Dark Mode";
                      break;
                    case .system:
                      icon = Icons.brightness_auto;
                      text = "System Mode";
                      break;
                  }

                  return Column(
                    children: [
                      Icon(
                        icon,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        text,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              const Text("Select Theme Mode:"),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: .center,
                children: [
                  FilledButton.icon(
                    onPressed: () => themeNotifier.saveThemeMode(.light),
                    icon: const Icon(Icons.wb_sunny),
                    label: const Text("Light"),
                  ),
                  FilledButton.icon(
                    onPressed: () => themeNotifier.saveThemeMode(.dark),
                    icon: const Icon(Icons.nightlight_round),
                    label: const Text("Dark"),
                  ),
                  FilledButton.icon(
                    onPressed: () => themeNotifier.saveThemeMode(.system),
                    icon: const Icon(Icons.brightness_auto),
                    label: const Text("System"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => themeNotifier.toggleTheme(),
                icon: const Icon(Icons.swap_horiz),
                label: const Text("Toggle Light/Dark"),
                style: ElevatedButton.styleFrom(
                  padding: const .symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
