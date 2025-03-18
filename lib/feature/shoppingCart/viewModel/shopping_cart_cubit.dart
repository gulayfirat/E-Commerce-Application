import 'package:e_commerce_app/model/cartModel/cartProductModel/cart_product_model.dart';
import 'package:e_commerce_app/model/cartModel/cart_model.dart';
import 'package:e_commerce_app/product/dummyData/dummy_cart_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/shoppingCart/viewModel/shopping_cart_state.dart';
import '../../../core/base/service/base_cache_service.dart';
import '../../../core/enums/service_path.dart';
import '../../../model/user/userCacheModel/user_cache_model.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../service/networkService/app_service.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit({required this.cacheService}) : super(ShoppingCartState()) {
    Future.microtask(() async {
      await cacheService?.init();
      getProducts();
      // await getCartsByUser();
    });
  }
  BaseCacheService<UserCacheModel>? cacheService;

  void getProducts() {
    emit(state.copyWith(carts: DummyCartList().dummyCarts));
  }

  // The data coming from the service is empty, tested from the browser, you can check the method if it comes. I created a dummy cart to add the cart page to the design.
  Future<void> getCartsByUser() async {
    try {
      UserCacheModel? _userCacheModel =
          await cacheService?.getItem(HiveConstants.userInfoBoxName);
      if (_userCacheModel?.id != null) {
        final List<CartModel>? carts = await AppService.instance.getListData(
          objectModel: CartModel(),
          onResponsePath: ServicePath.cartOnResponse.subUrl,
          path: "${ServicePath.cartsByUser.subUrl}1",
        );

        emit(state.copyWith(carts: carts));
        print(state.carts);
      }
    } catch (e) {
      print("getCartsByUser Error: $e");
    }
  }

  void increaseQuantity(int index) {
    final carts = List<CartModel>.from(state.carts ?? []);
    if (carts.isNotEmpty) {
      final products = List<CartProductModel>.from(carts.first.products ?? []);
      if (index >= 0 && index < products.length) {
        products[index] = products[index].copyWith(
          quantity: (products[index].quantity ?? 0) + 1,
        );
        carts[0] = carts.first.copyWith(products: products);
      }
      updateCarts(carts, products);
    }
    emit(state.copyWith(carts: carts));
  }

  void decreaseQuantity(int index) {
    final carts = List<CartModel>.from(state.carts ?? []);
    if (carts.isNotEmpty) {
      final products = List<CartProductModel>.from(carts.first.products ?? []);
      if (index >= 0 && index < products.length) {
        final currentQuantity = products[index].quantity ?? 0;
        if (currentQuantity > 1) {
          products[index] =
              products[index].copyWith(quantity: currentQuantity - 1);
        } else {
          products.removeAt(index);
        }
        updateCarts(carts, products);
      }
    }
    emit(state.copyWith(carts: carts));
  }

  CartModel updateCarts(
      List<CartModel> carts, List<CartProductModel> products) {
    return carts[0] = carts.first.copyWith(
        products: products,
        totalProducts: products.length,
        total: products.isNotEmpty
            ? products.fold<int>(
                0,
                (sum, item) =>
                    sum + ((item.price ?? 0) * (item.quantity ?? 1)).toInt())
            : 0);
  }

  void removeProduct(int index) {
    final carts = List<CartModel>.from(state.carts ?? []);
    final products =
        List<CartProductModel>.from(state.carts?.first.products ?? []);
    products.removeAt(index);
    carts[0] = carts.first.copyWith(
        products: products,
        totalProducts: products.length,
        total: products.isNotEmpty
            ? products.fold<int>(
                0,
                (sum, item) =>
                    sum + ((item.price ?? 0) * (item.quantity ?? 1)).toInt())
            : 0);
    emit(state.copyWith(carts: carts));
  }

  void clearCart() {
    final carts = List<CartModel>.from(state.carts ?? []);

    carts[0] = carts.first.copyWith(products: [], totalProducts: 0, total: 0);

    emit(state.copyWith(carts: carts));
  }
}
