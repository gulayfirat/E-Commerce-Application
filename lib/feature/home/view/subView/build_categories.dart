part of '../home_view.dart';

class _BuildCategories extends StatelessWidget {
  const _BuildCategories({
    required this.context,
    required this.homeCubit,
    required this.homeState,
  });

  final BuildContext context;
  final HomeCubit homeCubit;
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: ListView.builder(
          padding: context.dynamicSymmetricPadding(context.pageHorizontal, 0.0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeState.categories?.length,
          itemBuilder: (context, index) {
            return Container(
              constraints: BoxConstraints(minWidth: context.height * 0.12),
              decoration: BoxDecoration(
                  color:
                      homeState.selectedCategory == homeState.categories?[index]
                          ? AppColor.underwaterFern
                          : null,
                  borderRadius: context.border20Radius),
              child: Text(homeState.categories?[index] ?? "",
                      textAlign: TextAlign.center,
                      style: homeState.selectedCategory ==
                              homeState.categories?[index]
                          ? AppTextStyle.whiteRegular14
                          : AppTextStyle.platinumGraniteRegular14)
                  .pSymetric(horizontal: context.normalVal),
            ).pOnly(right: context.normalVal).gestureDetector(
                onTap: () => homeCubit.selectCategory(
                    category: homeState.categories?[index] ?? ""));
          }).pOnly(bottom: context.heighVal),
    );
  }
}
