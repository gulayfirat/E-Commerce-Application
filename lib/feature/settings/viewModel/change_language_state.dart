part of 'change_language_cubit.dart';

@immutable
class ChangeLanguageState extends Equatable {
  ChangeLanguageState({this.selectedLanguage});
  final String? selectedLanguage;

  @override
  List<Object?> get props => [selectedLanguage];

  ChangeLanguageState copyWith({String? selectedLanguage}) {
    return ChangeLanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
