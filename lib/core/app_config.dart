// lib/core/app_config.dart
import 'package:flutter/material.dart';

class AppConfig {
  final String appName;
  final Color primaryColor;
  final String apiUrl;
  final String logo;
  final String appCode;
  final String buildType;

  AppConfig({
    required this.appName,
    required this.primaryColor,
    required this.apiUrl,
    required this.logo,
    required this.appCode,
    required this.buildType,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['appName'],
      primaryColor: _colorFromHex(json['primaryColor']),
      apiUrl: json['apiUrl'],
      logo: json['logo'],
      appCode: json['appCode'],
      buildType: json['buildType'],
    );
  }
}

Color _colorFromHex(String hex) =>
    Color(int.parse(hex.replaceFirst('#', '0xff')));


