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
  String _preferredLang = "English";
  String get preferredLang => _preferredLang;
  List<String> get localeLanguages => _localeLanguages;

  ///Set user's preferred language to the selected language (String [value]).
  void setPreferredLanguage(String value) {
    _preferredLang = value;
    print("user preferred language: $_preferredLang");
  }
}
