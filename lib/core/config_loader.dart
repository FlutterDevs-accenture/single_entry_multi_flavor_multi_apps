import 'dart:convert';
import 'package:flutter/services.dart';
import 'app_config.dart';

class ConfigLoader {
  final String flavor;
  final String flavorName;

  ConfigLoader(this.flavor, this.flavorName);

  Future<AppConfig> load() async {
    final jsonString = await rootBundle.loadString('assets/config/$flavorName/$flavor.json');
    final jsonMap = jsonDecode(jsonString);
    return AppConfig.fromJson(jsonMap);
  }
}
