import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/pages/home_page.dart';
import 'package:mobx_provider/store/theme_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ThemeStore>(
          create: (_) => ThemeStore(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        title: 'Mobx and Provider demo',
        theme: context.watch<ThemeStore>().currentThemeData,
        home: const HomePage(),
      ),
    );
  }
}
