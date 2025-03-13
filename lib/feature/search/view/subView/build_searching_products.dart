part of '../search_view.dart';

class _BuildSearchingProduct extends StatelessWidget {
  const _BuildSearchingProduct({
    required this.context,
    required this.searchState,
  });

  final BuildContext context;
  final SearchState searchState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.SearchView_popularProduct.locale,
          style: AppTextStyle.blackRegular16,
        ).pOnly(bottom: context.heighVal),
        ListView.builder(
          shrinkWrap: true,
          itemCount: searchState.products?.length,
          itemBuilder: (context, index) {
            return ProductSearchCard(product: searchState.products?[index]);
          },
        ),
      ],
    );
  }
}
