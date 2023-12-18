import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snt_weather_app_case/feature/view/bottom_navbar_view.dart';
import 'package:snt_weather_app_case/feature/viewModel/weather_provider.dart';
import 'package:snt_weather_app_case/product/extensions/context_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<WeatherProvider>().fetchInitialData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          );
        } else {
          return const BottomNavbarView();
        }
      },
    );
  }
}
