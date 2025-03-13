part of '../home_view.dart';

class _BuildProductActions extends StatelessWidget {
  const _BuildProductActions({required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.HomeView_featuredProducts.locale,
              style: AppTextStyle.blackRegular16),
          Text(LocaleKeys.SameKeyword_seeAll.locale,
              style: AppTextStyle.platinumGraniteRegular14),
        ],
      ).pAll(context.pageHorizontal),
    );
  }
}
