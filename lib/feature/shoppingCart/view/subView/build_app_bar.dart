part of '../shopping_cart_view.dart';

CustomAppBar _buildAppBar(ShoppingCartCubit read, BuildContext context) {
  return CustomAppBar(
    title: LocaleKeys.ShoppingCartView_appBarTitle.locale,
    isBack: true,
    actions: [
      read.state.carts?.first.products?.length == 0
          ? SizedBox.shrink()
          : Assets.icons.icTrashSVG.toSvg
              .pSymetric(horizontal: context.normalVal * 2)
              .gestureDetector(
                  onTap: () => context.read<ShoppingCartCubit>().clearCart())
    ],
  );
}
