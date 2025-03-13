part of '../search_view.dart';

CustomAppBar _buildAppBar(BuildContext context) {
  return CustomAppBar(
    title: LocaleKeys.SameKeyword_search.locale,
    isBack: true,
    actions: [
      Assets.icons.icShoppingCartSVG.toSvg
          .pSymetric(horizontal: context.normalVal * 2)
          .gestureDetector(
              onTap: () => context.router.push(ShoppingCartRoute()))
    ],
  );
}
