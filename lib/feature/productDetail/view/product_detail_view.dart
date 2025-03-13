// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_app/product/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/feature/productDetail/viewModel/product_detail_cubit.dart';
import 'package:e_commerce_app/feature/productDetail/viewModel/product_detail_state.dart';
import 'package:e_commerce_app/product/companents/custom_cached_network_image.dart';
import 'package:e_commerce_app/product/companents/custom_rating_bar.dart';
import 'package:e_commerce_app/product/companents/product_card.dart';
import 'package:e_commerce_app/product/widgets/buttons/custom_elevated_button.dart';
import 'package:e_commerce_app/product/widgets/custom_app_bar.dart';

import '../../../core/assets/assets.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/enums/loading_status.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/companents/custom_service_error.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/router/app_router.dart';
import '../../../product/widgets/custom_circle_progress.dart';
import '../../../service/cacheService/user_info_cache_service.dart';

part 'subView/build_app_bar.dart';
part 'subView/build_product_overview.dart';
part 'subView/build_product_specification.dart';
part 'subView/build_tab_bar.dart';
part 'subView/build_product_features.dart';

@RoutePage()
class ProductDetailView extends StatefulWidget {
  final int? productId;
  const ProductDetailView({Key? key, this.productId}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
          productId: widget.productId ?? 1,
          cacheService:
              UserInfoCacheService(boxName: HiveConstants.userInfoBoxName)),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: BlocConsumer<ProductDetailCubit, ProductDetailState>(
          listener: (context, state) {
            state.isAddToCart == true
                ? context.router.popAndPush(const ShoppingCartRoute())
                : state.isAddToCart == false
                    ? _buildAddToCartErrorDialog(context)
                    : null;
          },
          builder: (context, state) {
            var read = context.read<ProductDetailCubit>();
            return state.loadingStatus == LoadingStatus.loading
                ? CustomCircleProgress(isLoading: true)
                : state.loadingStatus == LoadingStatus.success
                    ? buildBody(read)
                    : state.loadingStatus == LoadingStatus.failure
                        ? CustomServiceError()
                        : SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget buildBody(ProductDetailCubit productDetailCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "USD ${productDetailCubit.state.product?.price}",
              style: AppTextStyle.underwaterFernBold16,
            ),
            Text("${productDetailCubit.state.product?.title}",
                style: AppTextStyle.blackBold28),
          ],
        ).pAll(context.pageHorizontal),
        BuildTabBar(tabController: tabController, context: context),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              _BuildProductOverview(
                context: context,
                productDetailCubit: productDetailCubit,
              ),
              BuildProductFeatures(
                context: context,
                productDetailCubit: productDetailCubit,
              ),
              BuildProductSpecification(),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildAddToCartErrorDialog(BuildContext context) {
    return customShowDialog(
        context: context,
        child: Container(
            width: context.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(LocaleKeys.ProductDetailView_addToCartErrorMessage.locale,
                        style: AppTextStyle.blackRegular16,
                        textAlign: TextAlign.center)
                    .pConstBottom(context),
                CustomnElevatedButton(
                    onTap: () => context.maybePop(),
                    text: LocaleKeys.SameKeyword_ok.locale)
              ],
            ).pAll(context.heighVal)));
  }
}
