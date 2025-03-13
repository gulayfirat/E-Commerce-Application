part of '../home_view.dart';

class _BuildByCategoryProducts extends StatelessWidget {
  const _BuildByCategoryProducts({
    required this.context,
    required this.homeState,
  });

  final BuildContext context;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      child: ListView.builder(
          padding: context.dynamicSymmetricPadding(context.pageHorizontal, 0.0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeState.products?.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: homeState.products?[index],
              isVerticalItems: false,
            ).gestureDetector(
                onTap: () => context.pushRoute(ProductDetailRoute(
                    productId: homeState.products?[index].id)));
          }),
    );
  }
}
