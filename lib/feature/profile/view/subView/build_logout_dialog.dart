part of '../profile_view.dart';

Future<dynamic> _builLogoutDialog(
    BuildContext context, ProfileCubit profileCubit) {
  return customShowDialog(
      context: context,
      child: Container(
          width: context.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(LocaleKeys.Profile_logoutQuestion.locale,
                      style: AppTextStyle.blackRegular16,
                      textAlign: TextAlign.center)
                  .pConstBottom(context),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomnElevatedButton(
                        onTap: () => context.maybePop(),
                        text: LocaleKeys.SameKeyword_no.locale),
                  ),
                  SizedBox(width: context.heighVal),
                  Flexible(
                    flex: 1,
                    child: CustomnElevatedButton(
                        onTap: () {
                          profileCubit.logout();
                        },
                        text: LocaleKeys.SameKeyword_yes.locale),
                  )
                ],
              ).sized(width: context.width, height: context.height * 0.1)
            ],
          ).pAll(context.heighVal * 2)));
}
