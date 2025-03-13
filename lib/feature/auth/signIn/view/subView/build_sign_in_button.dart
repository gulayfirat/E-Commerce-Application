part of '../sign_in_view.dart';

class _BuildSignInButton extends StatelessWidget {
  const _BuildSignInButton({
    required SignInCubit signInCubit,
  }) : _signInCubit = signInCubit;

  final SignInCubit _signInCubit;

  @override
  Widget build(BuildContext context) {
    return CustomnElevatedButton(
      onTap: () async => await _signInCubit.login(),
      text: LocaleKeys.SignInView_signInButton.locale,
    );
  }
}
