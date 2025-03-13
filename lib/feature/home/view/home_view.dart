import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/core/assets/assets.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/product/companents/custom_service_error.dart';
import 'package:e_commerce_app/product/router/app_router.dart';
import 'package:e_commerce_app/product/widgets/custom_circle_progress.dart';
import 'package:e_commerce_app/product/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/home/viewModel/home_cubit.dart';
import 'package:e_commerce_app/feature/home/viewModel/home_state.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/companents/product_card.dart';
import '../../../product/widgets/custom_app_bar.dart';
part 'subView/build_app_bar.dart';
part 'subView/build_featured_products.dart';
part 'subView/build_categories.dart';
part 'subView/build_by_category_products.dart';
part 'subView/build_search_button.dart';
part 'subView/build_product_actions.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) async {
          if (state.loadingStatus == LoadingStatus.success) {
            await context.read<HomeCubit>().getUser();
          }
        },
        builder: (BuildContext context, HomeState state) {
          var read = context.read<HomeCubit>();
          return Scaffold(
              appBar: _buildAppBar(context, read),
              body: state.loadingStatus == LoadingStatus.loading
                  ? CustomCircleProgress(isLoading: true)
                  : state.loadingStatus == LoadingStatus.success
                      ? buildBody(read)
                      : state.loadingStatus == LoadingStatus.failure
                          ? CustomServiceError()
                          : SizedBox.shrink());
        },
      ),
    );
  }

  Widget buildBody(HomeCubit homeCubit) {
    return Column(
      children: [
        _BuildSearchButton(context: context, homeCubit: homeCubit),
        Expanded(
          child: Container(
            width: context.width,
            decoration: BoxDecoration(
                color: AppColor.cascadingWhite,
                borderRadius: context.borderVerticalTop28Radius),
            child: Column(
              children: [
                _BuildCategories(
                    context: context,
                    homeCubit: homeCubit,
                    homeState: homeCubit.state),
                _BuildByCategoryProducts(
                    context: context, homeState: homeCubit.state),
                _BuildProductActions(context: context),
                _BuildFeaturedProducts(
                    context: context, homeState: homeCubit.state),
              ],
            ).pSymetric(vertical: context.normalVal * 3),
          ),
        )
      ],
    );
  }
}
