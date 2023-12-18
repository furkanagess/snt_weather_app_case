import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:snt_weather_app_case/feature/viewModel/bottom_navbar_provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/temperature_unit_provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/weather_provider.dart';
import 'package:snt_weather_app_case/feature/viewModel/theme_provider.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  late String apiType;

  List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(
      create: (context) {
        var weatherProvider = WeatherProvider();
        weatherProvider.fetchInitialData();
        return weatherProvider;
      },
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TemperatureUnitProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => BottomNavbarProvider(),
    ),
  ];
}
