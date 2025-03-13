// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../product_detail_view.dart';

class _BuildProductOverview extends StatelessWidget {
  const _BuildProductOverview({
    required this.context,
    required this.productDetailCubit,
  });

  final BuildContext context;

  final ProductDetailCubit productDetailCubit;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _BuildProductImages(productDetailState: productDetailCubit.state),
        _BuildReviews(
          context: context,
          productDetailState: productDetailCubit.state,
          productDetailCubit: productDetailCubit,
        ),
        _BuildOtherProducts(
          context: context,
          productDetailState: productDetailCubit.state,
        ),
        CustomnElevatedButton(
                onTap: () => productDetailCubit.addToCart(),
                text: LocaleKeys.ProductDetailView_addToCartButton.locale)
            .pAll(context.pageHorizontal)
      ],
    );
  }
}

class _BuildProductImages extends StatelessWidget {
  const _BuildProductImages({
    required this.productDetailState,
  });

  final ProductDetailState productDetailState;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productDetailState.product?.images?.length,
          itemBuilder: (context, index) {
            return Container(
              height: context.height * 0.45,
              width: (productDetailState.product?.images?.length ?? 0) > 1
                  ? context.width * 0.75
                  : context.width * 0.92,
              decoration: BoxDecoration(
                  color: AppColor.cascadingWhite,
                  borderRadius: context.border10Radius),
              child: CustomCachedNetworkImage(
                  imageUrl: productDetailState.product?.images?[index] ?? ""),
            ).pSymetric(horizontal: context.pageHorizontal);
          },
        ).sized(height: context.height * 0.45);
      },
    );
  }
}

class _BuildReviews extends StatelessWidget {
  const _BuildReviews(
      {required this.context,
      required this.productDetailState,
      required this.productDetailCubit});

  final BuildContext context;
  final ProductDetailState productDetailState;
  final ProductDetailCubit productDetailCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.ProductDetailView_review.locale +
              " (${productDetailState.product?.reviews?.length})",
          style: AppTextStyle.blackRegular16,
        ).pSymetric(vertical: context.heighVal),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: productDetailState.productLength,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: Assets.images.imProfilePNG.toImageProvider,
                ).pOnly(right: context.heighVal),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                        productDetailState
                                                .product
                                                ?.reviews?[index]
                                                .reviewerName ??
                                            "",
                                        style: AppTextStyle.blackRegular16)
                                    .pOnly(right: context.heighVal),
                                CustomRatingBar(
                                    rating: productDetailState
                                            .product?.reviews?[index].rating ??
                                        0,
                                    itemCount: 5),
                              ],
                            ),
                          ),
                          Text(
                            productDetailState.product?.reviews?[index].date
                                    ?.toFormattedString() ??
                                "",
                            style: AppTextStyle.platinumGraniteRegular12,
                          )
                        ],
                      ),
                      Text(
                        productDetailState.product?.reviews?[index].comment ??
                            "",
                        style: AppTextStyle.blackRegular14,
                      )
                    ],
                  ),
                )
              ],
            ).sized(width: context.width).pOnly(bottom: context.heighVal);
          },
        ),
        Visibility(
          visible: (productDetailState.product?.reviews?.length ?? 0) < 2
              ? false
              : true,
          child: Text(
            LocaleKeys.ProductDetailView_seeAllReviews.locale,
            style: AppTextStyle.platinumGraniteRegular12,
          ).center().pSymetric(vertical: context.heighVal).gestureDetector(
              onTap: () {
            productDetailCubit.seeAllReviews(isSeeAll: true);
          }),
        ),
      ],
    ).pAll(context.pageHorizontal);
  }
}

class _BuildOtherProducts extends StatelessWidget {
  const _BuildOtherProducts({
    Key? key,
    required this.context,
    required this.productDetailState,
  }) : super(key: key);

  final BuildContext context;
  final ProductDetailState productDetailState;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cascadingWhite,
      padding: context.dynamicOnlyPadding(top: context.heighVal),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LocaleKeys.ProductDetailView_anotherProduct.locale,
                  style: AppTextStyle.blackRegular16),
              Text(LocaleKeys.SameKeyword_seeAll.locale,
                  style: AppTextStyle.platinumGraniteRegular14,
                  textAlign: TextAlign.center)
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productDetailState.products?.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(
                      product: productDetailState.products?[index],
                      isVerticalItems: true)
                  .pOnly(
                      bottom: context.heighVal * 2.5,
                      top: context.heighVal * 1.5)
                  .gestureDetector(
                      onTap: () => context.pushRoute(ProductDetailRoute(
                          productId: productDetailState.products?[index].id)));
            },
          ).sized(height: context.height * 0.32),
        ],
      ).pAll(context.pageHorizontal),
    );
  }
}
