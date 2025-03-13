import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/assets/assets.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/product/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/search/viewModel/search_cubit.dart';
import 'package:e_commerce_app/feature/search/viewModel/search_state.dart';
import '../../../core/enums/loading_status.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/companents/custom_service_error.dart';
import '../../../product/companents/product_search_card.dart';
import '../../../product/router/app_router.dart';
import '../../../product/widgets/custom_circle_progress.dart';
import '../../../product/widgets/custom_text_field.dart';
part 'subView/build_searching_products.dart';
part 'subView/build_app_bar.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _searchCubit = SearchCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<SearchCubit, SearchState>(
        bloc: _searchCubit,
        listener: (BuildContext context, SearchState state) {},
        builder: (BuildContext context, SearchState state) {
          return state.loadingStatus == LoadingStatus.loading
              ? CustomCircleProgress(isLoading: true)
              : state.loadingStatus == LoadingStatus.success
                  ? buildBody(state)
                  : state.loadingStatus == LoadingStatus.failure
                      ? CustomServiceError()
                      : SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildBody(SearchState state) {
    return ListView(
      children: [
        CustomTextField(
          focusNode: _searchCubit.focusNode,
          textInputAction: TextInputAction.search,
          hintText: LocaleKeys.SameKeyword_search.locale,
          prefixIcon: Assets.icons.icSearchSVG,
          onChanged: (value) => _searchCubit.searchProduct(query: value),
        ),
        _BuildSearchingProduct(context: context, searchState: state)
      ],
    ).pAll(context.pageHorizontal);
  }
}
