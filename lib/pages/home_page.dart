import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/pages/settings_page.dart';
import 'package:mobx_provider/store/theme_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx Theme"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Observer(
            builder: (context) => Column(
              children: [
                ListTile(
                  title: const Text("Light Theme"),
                  leading: Radio(
                    value: ThemeType.light,
                    groupValue: context.read<ThemeStore>().currentThemeType,
                    onChanged: (_) {
                      context
                          .read<ThemeStore>()
                          .changeCurrentTheme(ThemeType.light);
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Dark Theme"),
                  leading: Radio(
                    value: ThemeType.dark,
                    groupValue: context.read<ThemeStore>().currentThemeType,
                    onChanged: (_) {
                      context
                          .read<ThemeStore>()
                          .changeCurrentTheme(ThemeType.dark);
                    },
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.deepPurple,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
            child: const Text("Go to Settings page"),
          )
        ],
      ),
    );
  }
}
