part of '../home_view.dart';

class _BuildSearchButton extends StatelessWidget {
  const _BuildSearchButton({
    required this.context,
    required this.homeCubit,
  });

  final BuildContext context;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            LocaleKeys.HomeView_title.locale +
                "${homeCubit.state.user?.firstName}",
            style: AppTextStyle.blackRegular16),
        Text(LocaleKeys.HomeView_subTitle.locale,
                style: AppTextStyle.blackBold24)
            .pOnly(bottom: context.height * 0.025),
        AbsorbPointer(
          child: CustomTextField(
              focusNode: homeCubit.focusNode,
              hintText: LocaleKeys.SameKeyword_search.locale,
              prefixIcon: Assets.icons.icSearchSVG),
        ).gestureDetector(onTap: () => context.router.push(SearchRoute())),
      ],
    ).pSymetric(horizontal: context.pageHorizontal);
  }
}
