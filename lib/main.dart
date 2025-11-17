// lib/app.dart
import 'package:flutter/material.dart';
import 'package:one_code_base/core/behavior/app_behavior.dart';
import 'app.dart';
import 'core/config_loader.dart';
import 'core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const String appType = String.fromEnvironment('APP_TYPE');
  const String buildType = String.fromEnvironment('BUILD_TYPE');
  switch(appType) {
    case 'accenture':
      _runAccentureApp(buildType);
      break;
    case 'jci':
      _runJciApp(buildType);
      break;
    // You can add more cases here for different app types
    default:
      throw Exception('Unknown APP_TYPE: $appType');
  }
}

Future<void> _runJciApp(String buildType) async {
  final config = await ConfigLoader("jci_$buildType", "jci").load();
  setupDI(config, JciBehavior());
  runApp(MyApp(config: config));
}

Future<void> _runAccentureApp(String buildType) async {
  final config = await ConfigLoader("accenture_$buildType", "accenture").load();
  setupDI(config, AccentureBehavior());
  runApp(MyApp(config: config));
}
