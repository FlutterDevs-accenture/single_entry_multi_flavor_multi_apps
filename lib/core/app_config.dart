// lib/core/app_config.dart
import 'package:get_it/get_it.dart';
import 'app_config.dart';
import 'behavior/app_behavior.dart';
import '../utils/api_client.dart';
import 'package:flutter/material.dart';

class AppConfig {
  final String appName;
  final Color primaryColor;
  final String apiUrl;
  final String logo;

  AppConfig({
    required this.appName,
    required this.primaryColor,
    required this.apiUrl,
    required this.logo,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['appName'],
      primaryColor: _colorFromHex(json['primaryColor']),
      apiUrl: json['apiUrl'],
      logo: json['logo'],
    );
  }
}

Color _colorFromHex(String hex) =>
    Color(int.parse(hex.replaceFirst('#', '0xff')));


