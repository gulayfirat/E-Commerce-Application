import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import '../../enums/language_items.dart';
import '../../init/lang/locale_keys.g.dart';

extension LanguageItemsExtension on LanguageItems {
  String getLocalLanguage() {
    switch (this) {
      case LanguageItems.tr:
        return LocaleKeys.ChangeLanguageView_trLanguage.locale;
      case LanguageItems.en:
        return LocaleKeys.ChangeLanguageView_enLanguage.locale;
    }
  }
}
