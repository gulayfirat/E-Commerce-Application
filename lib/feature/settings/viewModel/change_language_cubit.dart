import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/extension/enum/language_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/enums/language_items.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/manager/language_manager.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageState());
  List<String> languageList = [
    LocaleKeys.ChangeLanguageView_enLanguage.locale,
    LocaleKeys.ChangeLanguageView_trLanguage.locale,
  ];
  String? selectedLanguage;

  void onChangeLanguage(BuildContext context, value) {
    if (value == LocaleKeys.ChangeLanguageView_enLanguage.locale) {
      selectedLanguage = value;
      context.setLocale(LanguageManager.instance.enLocale);
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    if (value == LocaleKeys.ChangeLanguageView_trLanguage.locale) {
      selectedLanguage = value;
      context.setLocale(LanguageManager.instance.trLocale);
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
  }

  void getSelectedLanguage(BuildContext context) {
    if (context.locale == LanguageManager.instance.enLocale) {
      selectedLanguage = LanguageItems.en.getLocalLanguage();
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    if (context.locale == LanguageManager.instance.trLocale) {
      selectedLanguage = LanguageItems.tr.getLocalLanguage();
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    selectedLanguage = LanguageItems.en.getLocalLanguage();
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }
}
