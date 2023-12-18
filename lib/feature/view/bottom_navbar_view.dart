import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snt_weather_app_case/feature/view/weather_view.dart';
import 'package:snt_weather_app_case/feature/view/settings_view.dart';
import 'package:snt_weather_app_case/feature/viewModel/bottom_navbar_provider.dart';
import 'package:snt_weather_app_case/product/constants/app_strings.dart';

class BottomNavbarView extends StatelessWidget {
  const BottomNavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildPage(context.read<BottomNavbarProvider>().currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<BottomNavbarProvider>().currentIndex,
        onTap: (index) {
          context.read<BottomNavbarProvider>().setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: AppStrings.weather,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppStrings.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return WeatherPage();
      case 1:
        return const SettingsPage();
      default:
        return const SizedBox();
    }
  }
}
