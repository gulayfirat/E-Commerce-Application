part of '../home_view.dart';

CustomAppBar _buildAppBar(BuildContext context, HomeCubit homeCubit) {
  return CustomAppBar(
    title: LocaleKeys.SameKeyword_title.locale,
    isVisibleLogo: true,
    leading: Assets.icons.icMenuSVG.toSvg,
    actions: [
      CircleAvatar(
        backgroundImage:
            (homeCubit.state.user?.image ?? "").toNetworkImageProvider,
      )
          .pSymetric(horizontal: context.normalVal * 2)
          .gestureDetector(onTap: () => context.router.push(ProfileRoute()))
    ],
  );
}
