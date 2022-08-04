import 'package:dicoding_flutter_submission/constant.dart';
import 'package:dicoding_flutter_submission/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            title: 'Zoo Animal',
            debugShowCheckedModeBanner: false,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(primarySwatch: Colors.blue),
            darkTheme: ThemeData.dark(),
            home: const Scaffold(body: MyHomePage()),
          );
        });
  }
}
