import 'package:flutter/widgets.dart';

class OnboardingViewModel {
  OnboardingViewModel._();
  static final _internal = OnboardingViewModel._();
  factory OnboardingViewModel() => _internal;

  final List<String> _localeLanguages = [
    "English",
    "Español",
    "Français",
    "German",
    "Chinese",
    "Japanese",
    "Korea",
    "Korea",
    "Korea",
  ];
  final ValueNotifier<String> preferredLang = ValueNotifier("English");
  List<String> get localeLanguages => _localeLanguages;

  ///Set user's preferred language to the selected language (String [value]).
  void setPreferredLanguage(String value) {
    preferredLang.value = value;
    print("user preferred language: ${preferredLang.value}");
  }
}
