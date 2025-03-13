part of '../product_detail_view.dart';

class BuildProductFeatures extends StatelessWidget {
  const BuildProductFeatures({
    Key? key,
    required this.context,
    required this.productDetailCubit,
  }) : super(key: key);

  final BuildContext context;
  final ProductDetailCubit productDetailCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            children: [
              Text(
                productDetailCubit.state.product?.title ?? "",
                style: AppTextStyle.blackBold16,
              ),
              Text(
                productDetailCubit.state.product?.description ?? "",
                style: AppTextStyle.blackRegular14,
              ),
            ],
          ),
        ),
        CustomnElevatedButton(
          onTap: () => productDetailCubit.addToCart(),
          text: LocaleKeys.ProductDetailView_addToCartButton.locale,
        ).pOnly(bottom: context.heighVal * 3)
      ],
    ).pSymetric(horizontal: context.pageHorizontal);
  }
}
