part of '../product_detail_view.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
    required this.tabController,
    required this.context,
  });

  final TabController? tabController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: AppColor.transparent,
      indicatorColor: AppColor.underwaterFern,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: context.dynamicSymmetricPadding(
          context.normalVal * 2, context.normalVal),
      unselectedLabelColor: AppColor.black,
      labelColor: AppColor.black,
      labelStyle: AppTextStyle.blackRegular16,
      padding: context.zeroPadding,
      labelPadding: context.zeroPadding,
      tabs: <Widget>[
        Tab(text: LocaleKeys.ProductDetailView_tabOverview.locale),
        Tab(text: LocaleKeys.ProductDetailView_tabFeatures.locale),
        Tab(text: LocaleKeys.ProductDetailView_tabSpecification.locale),
      ],
    );
  }
}
