import 'package:flutter/material.dart';
import 'package:mobx_provider/store/theme_store.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = context.read<ThemeStore>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.deepPurple,
            ),
          ),
          onPressed: () {
            ThemeType changeTo = themeStore.currentThemeType == ThemeType.light
                ? ThemeType.dark
                : ThemeType.light;
            themeStore.changeCurrentTheme(changeTo);
          },
          child: const Text("Change Theme"),
        ),
      ),
    );
  }
}
