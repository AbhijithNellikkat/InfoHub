import 'package:flutter/material.dart';
import 'package:news_app/controller/theme_controller.dart';
import 'package:provider/provider.dart';
import 'views/splash_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashView(),
    );
  }
}
