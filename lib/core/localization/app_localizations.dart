import 'dart:convert';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Map<String, String> _localizedStrings;
  AppLocalizations(this._localizedStrings);

  String translate(String key) => _localizedStrings[key] ?? key;

  static Future<AppLocalizations> load() async {
    final jsonString = await rootBundle.loadString('assets/localization/en.json');
    final map = Map<String, String>.from(json.decode(jsonString));
    return AppLocalizations(map);
  }
}
