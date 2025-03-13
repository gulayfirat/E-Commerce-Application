part of '../home_view.dart';

class _BuildFeaturedProducts extends StatelessWidget {
  const _BuildFeaturedProducts({
    required this.context,
    required this.homeState,
  });

  final BuildContext context;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 12,
      child: ListView.builder(
          padding: context.dynamicSymmetricPadding(context.pageHorizontal, 0.0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeState.products?.length,
          itemBuilder: (context, index) {
            return ProductCard(
                    product: homeState.products?[index], isVerticalItems: true)
                .gestureDetector(
                    onTap: () => context.pushRoute(ProductDetailRoute(
                        productId: homeState.products?[index].id)));
          }),
    );
  }
}
