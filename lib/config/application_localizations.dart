import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application_localizations_delegate.dart';

class ApplicationLocalizations {
  final Locale appLocale;
  late Map<String, String> _localizedStrings;
  String _translatedKey = "";
  ApplicationLocalizations(this.appLocale);

  static ApplicationLocalizations? of(BuildContext context) {
    return Localizations.of<ApplicationLocalizations>(
        context, ApplicationLocalizations);
  }

  static const LocalizationsDelegate<ApplicationLocalizations> delegate =
      ApplicationLocalizationsDelegate();

  Future<bool> load() async {
    // Load JSON file from the "language" folder
    String jsonString = await rootBundle
        .loadString('assets/locale/${appLocale.languageCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // called from every widget which needs a localized text
  // String translate(String key) {
  //   return _localizedStrings[key] ?? "";
  // }
  String translate(String key, {List<dynamic>? args}) {
    if (null == _localizedStrings[key]) return "";

    _translatedKey = _localizedStrings[key] ?? "";
    if (null == args || args.isEmpty) {
      return _translatedKey;
    } else {
      for (int i = 0; i < args.length; ++i) {
        _translatedKey = _translatedKey.replaceAll("{$i}", args[i]);
      }
      return _translatedKey;
    }
  }

  String getLocale() {
    return appLocale.countryCode ?? "US";
  }
}
