// import 'package:flutter/material.dart';

// @immutable
// final class HourlyWeather {
//   final String time;
//   final double temperature;

//   const HourlyWeather({
//     required this.time,
//     required this.temperature,
//   });
// }

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'hourly_weather.g.dart';

@JsonSerializable()
@immutable
final class HourlyWeather with EquatableMixin {
  final String time;
  final double temperature;

  HourlyWeather({
    required this.time,
    required this.temperature,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherToJson(this);

  @override
  List<Object?> get props => [time, temperature];

  HourlyWeather copyWith({
    String? time,
    double? temperature,
  }) {
    return HourlyWeather(
      time: time ?? this.time,
      temperature: temperature ?? this.temperature,
    );
  }
}
