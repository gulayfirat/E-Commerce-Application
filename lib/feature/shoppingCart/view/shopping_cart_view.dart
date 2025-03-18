// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/assets/assets.dart';
import 'package:e_commerce_app/core/constants/app_text_style.dart';
import 'package:e_commerce_app/core/extension/context/context_extension.dart';
import 'package:e_commerce_app/core/extension/string/string_extension.dart';
import 'package:e_commerce_app/core/extension/widget/widget_extension.dart';
import 'package:e_commerce_app/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_app/feature/shoppingCart/viewModel/shopping_cart_cubit.dart';
import 'package:e_commerce_app/feature/shoppingCart/viewModel/shopping_cart_state.dart';
import '../../../product/companents/shopping_cart.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/router/app_router.dart';
import '../../../product/widgets/buttons/custom_elevated_button.dart';
import '../../../product/widgets/custom_app_bar.dart';
import '../../../service/cacheService/user_info_cache_service.dart';
part 'subView/build_app_bar.dart';

@RoutePage()
class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShoppingCartCubit>(
      create: (context) => ShoppingCartCubit(
          cacheService:
              UserInfoCacheService(boxName: HiveConstants.userInfoBoxName)),
      child: BlocConsumer<ShoppingCartCubit, ShoppingCartState>(
        listener: (context, state) {},
        builder: (context, state) {
          ShoppingCartCubit read = context.read<ShoppingCartCubit>();
          return Scaffold(
              appBar: _buildAppBar(read, context),
              body: read.state.carts?.first.products?.length == 0
                  ? _buildDiscoverButton(context)
                  : buildBody(read));
        },
      ),
    );
  }

  Center _buildDiscoverButton(BuildContext context) {
    return Center(
        child: CustomnElevatedButton(
                onTap: () => context.router.popAndPush(const HomeRoute()),
                text: LocaleKeys.ShoppingCartView_discoverProducts.locale)
            .pSymetric(horizontal: context.heighVal * 3));
  }

  Widget buildBody(ShoppingCartCubit shoppingCartCubit) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: shoppingCartCubit.state.carts?.first.products?.length,
            itemBuilder: (BuildContext context, int index) {
              return ShoppingCart(
                  product:
                      shoppingCartCubit.state.carts?.first.products?[index],
                  removeProduct: shoppingCartCubit.removeProduct,
                  decreaseQuantity: shoppingCartCubit.decreaseQuantity,
                  increaseQuantity: shoppingCartCubit.increaseQuantity,
                  index: index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "${LocaleKeys.ShoppingCartView_total.locale} ${shoppingCartCubit.state.carts?.first.totalProducts} ${LocaleKeys.ShoppingCartView_product.locale}",
                style: AppTextStyle.blackBold12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("USD", style: AppTextStyle.blackBold16),
                Text("${shoppingCartCubit.state.carts?.first.total}",
                    style: AppTextStyle.blackBold16)
              ],
            )
          ],
        ),
        CustomnElevatedButton(
                onTap: () {},
                text: LocaleKeys.ShoppingCartView_checkout.locale,
                trailing: Assets.icons.icIosArrowRightSVG.toSvg)
            .pSymetric(vertical: context.heighVal)
      ],
    ).pAll(context.pageHorizontal);
  }
}
