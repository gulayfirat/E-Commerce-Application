import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/signIn/view/sign_in_view.dart';
import '../../feature/auth/splash/view/splash_view.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/productDetail/view/product_detail_view.dart';
import '../../feature/profile/view/profile_view.dart';
import '../../feature/search/view/search_view.dart';
import '../../feature/settings/view/change_language_view.dart';
import '../../feature/shoppingCart/view/shopping_cart_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: ShoppingCartRoute.page),
        AutoRoute(page: ChangeLanguageRoute.page),
      ];
}
