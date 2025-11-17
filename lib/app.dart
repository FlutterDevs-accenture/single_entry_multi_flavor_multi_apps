// lib/app.dart
import 'package:flutter/material.dart';
import 'core/app_config.dart';
import 'core/localization/app_localizations.dart';
import 'features/auth/ui/login_screen.dart';

class MyApp extends StatelessWidget {
  final AppConfig config;
  const MyApp({required this.config, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppLocalizations>(
      future: AppLocalizations.load(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        final loc = snapshot.data!;
        return MaterialApp(
          title: config.appName,
          theme: ThemeData(primaryColor: config.primaryColor),
          home: LoginScreen(config: config, loc: loc),
        );
      },
    );
  }
}
