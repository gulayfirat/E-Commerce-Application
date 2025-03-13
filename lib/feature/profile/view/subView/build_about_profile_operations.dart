part of '../profile_view.dart';

class _BuildAboutProfileOperations extends StatelessWidget {
  const _BuildAboutProfileOperations(
      {required this.context, required this.profileCubit});

  final ProfileCubit profileCubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _BuildProfileInfo(profileCubit: profileCubit),
        _buildDivider(),
        _buildTitle(title: LocaleKeys.Profile_generalTitle.locale),
        _buildItem(item: LocaleKeys.Profile_editProfileItem.locale),
        _buildDivider(),
        _buildItem(item: LocaleKeys.Profile_notificationsItem.locale),
        _buildDivider(),
        _buildItem(item: LocaleKeys.Profile_languageItem.locale)
            .gestureDetector(
                onTap: () => context.pushRoute(ChangeLanguageRoute())),
        _buildDivider(),
        _buildItem(item: LocaleKeys.Profile_wishlistItem.locale),
        _buildDivider(),
        _buildTitle(title: LocaleKeys.Profile_legalTitle.locale),
        _buildItem(item: LocaleKeys.Profile_termsOfUseItem.locale),
        _buildDivider(),
        _buildItem(item: LocaleKeys.Profile_privacyPolicyItem.locale),
        _buildDivider(),
        _buildTitle(title: LocaleKeys.Profile_personalTitle.locale),
        _buildItem(item: LocaleKeys.Profile_reportBugItem.locale),
        _buildDivider(),
        _buildItem(item: LocaleKeys.Profile_logoutItem.locale).gestureDetector(
            onTap: () {
          _builLogoutDialog(context, profileCubit);
        }),
      ],
    );
  }

  Divider _buildDivider() {
    return Divider(height: context.kZero);
  }

  Padding _buildItem({required String item}) {
    return Text(
      item,
      style: AppTextStyle.blackRegular16,
    ).pAll(context.pageHorizontal);
  }

  Padding _buildTitle({required String title}) =>
      Text(title, style: AppTextStyle.platinumGraniteRegular14)
          .pAll(context.pageHorizontal);
}
