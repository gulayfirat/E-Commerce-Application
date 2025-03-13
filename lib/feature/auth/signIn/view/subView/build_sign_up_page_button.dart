part of '../sign_in_view.dart';

class _BuildSignUpPageButton extends StatelessWidget {
  const _BuildSignUpPageButton();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: LocaleKeys.SignInView_dontHaveAccount.locale,
              style: AppTextStyle.whiteRegular14),
          TextSpan(
              text: LocaleKeys.SignInView_signUpButton.locale,
              style: AppTextStyle.underwaterFernBold14
                  .copyWith(decoration: TextDecoration.underline)),
        ],
      ),
    ).pOnly(bottom: context.height * 0.042, top: context.height * 0.03);
  }
}
