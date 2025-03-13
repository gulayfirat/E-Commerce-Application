part of '../sign_in_view.dart';

class _BuildFormFields extends StatelessWidget {
  const _BuildFormFields({required this.read, required this.context});

  final SignInCubit read;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
                controller: read.usernameController,
                prefixIcon: Assets.icons.icUserSVG,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hintText: LocaleKeys.SignInView_username.locale,
                validator: (value) => value.emptyValidate)
            .pOnly(
                top: MediaQuery.of(context).viewInsets.bottom > 0
                    ? context.height * 0.05
                    : context.height * 0.32),
        CustomTextField(
            controller: read.passwordController,
            prefixIcon: Assets.icons.icLockSVG,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: LocaleKeys.SignInView_password.locale,
            obscureText: true,
            validator: (value) => value.emptyValidate),
      ],
    );
  }
}
