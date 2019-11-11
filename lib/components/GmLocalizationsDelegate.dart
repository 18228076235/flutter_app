import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroid_app/components/GmLocalizations.dart';

class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);
  @override
  Future<GmLocalizations> load(Locale locale) {
    return SynchronousFuture<GmLocalizations>(
        GmLocalizations(locale.languageCode));
  }

  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
