part of '../product_detail_view.dart';

CustomAppBar _buildAppBar(BuildContext context) {
  return CustomAppBar(
    title: LocaleKeys.ProductDetailView_appBarTitle.locale,
    isBack: true,
    actions: [
      Assets.icons.icShoppingCartSVG.toSvg
          .pSymetric(horizontal: context.normalVal * 2)
          .gestureDetector(
              onTap: () => context.router.push(ShoppingCartRoute())),
    ],
  );
}
