// lib/features/auth/login_screen.dart

import '../../../src/accenture/home_accenture.dart';
import '../../../src/jci/home_jci.dart';
import 'package:flutter/material.dart';
import '../../../core/di/di.dart';
import '../../../core/behavior/app_behavior.dart';
import '../../../core/app_config.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/text_resources.dart';

class LoginScreen extends StatelessWidget {
  final AppConfig config;
  final AppLocalizations loc;
  const LoginScreen({required this.config, required this.loc, super.key});

  @override
  Widget build(BuildContext context) {
    final AppBehavior behavior = getIt<AppBehavior>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('${loc.translate(TextResources.login)} - ${config.appName}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(config.logo, width: 200),
            TextField(controller: emailController, decoration: InputDecoration(labelText: loc.translate(TextResources.email))),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: loc.translate(TextResources.password)), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Login pressed for ${config.appName}');
                config.appCode == 'ACN'
                    ? HomeAccenture()
                    : HomeJci();

               // behavior.login(emailController.text, passwordController.text);

              },
              child: Text(loc.translate(TextResources.login)),
            ),
            TextButton(
              onPressed: () {  },
              child: Text(loc.translate(TextResources.signup)),
            )
          ],
        ),
      ),
    );
  }
}
