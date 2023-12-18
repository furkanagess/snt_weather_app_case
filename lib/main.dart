import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/view/splash_view.dart';
import 'package:snt_weather_app_case/product/init/app_provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/theme_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ...ApplicationProvider.instance.appProviders,
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: context.watch<ThemeProvider>().currentTheme,
    );
  }
}
