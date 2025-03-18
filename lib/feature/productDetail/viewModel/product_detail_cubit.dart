import 'dart:developer';
import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/model/addToCartModel/addCartProductModel/add_cart_product_model.dart';
import 'package:e_commerce_app/model/addToCartModel/add_to_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/productDetail/viewModel/product_detail_state.dart';
import '../../../core/base/service/base_cache_service.dart';
import '../../../core/enums/service_path.dart';
import '../../../model/productModel/product_model.dart';
import '../../../model/user/userCacheModel/user_cache_model.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../service/networkService/app_service.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required this.productId, required this.cacheService})
      : super(ProductDetailState()) {
    Future.microtask(
      () async {
        try {
          emit(state.copyWith(loadingStatus: LoadingStatus.loading));
          await cacheService?.init();
          await getProduct(productId: productId);
          getReviewsLeght();
          emit(state.copyWith(loadingStatus: LoadingStatus.success));
        } catch (error) {
          emit(state.copyWith(loadingStatus: LoadingStatus.failure));
        }
      },
    );
  }
  BaseCacheService<UserCacheModel>? cacheService;
  final int productId;
  Future<void> getProducts({String? category}) async {
    try {
      final List<ProductModel>? products =
          await AppService.instance.getListData(
        objectModel: ProductModel(),
        onResponsePath: ServicePath.productOnResponse.subUrl,
        path: category == null
            ? ServicePath.products.subUrl
            : "${ServicePath.productsCategory.subUrl}$category",
      );
      emit(state.copyWith(products: products));
      print(state.products);
    } catch (e) {
      print("getProducts Error: $e");
    }
  }

  Future<void> getProduct({int? productId}) async {
    try {
      final ProductModel product = await AppService.instance.getObjectData(
          objectModel: ProductModel(),
          path: ServicePath.singleProduct.subUrl + '${productId ?? 1}');

      emit(state.copyWith(product: product));
      await getProducts(category: state.product?.category);
      print(state.product);
    } catch (e) {
      print("getProducts Error: $e");
    }
  }

  Future<void> addToCart() async {
    emit(state.copyWith(isAddToCart: null));
    log(state.isAddToCart.toString());
    try {
      UserCacheModel? _userCacheModel =
          await cacheService?.getItem(HiveConstants.userInfoBoxName);
      if (_userCacheModel?.id != null) {
        AddToCartModel addToCartModel = AddToCartModel(
            userId: _userCacheModel?.id,
            products: [AddCartProductModel(id: productId, quantity: 1)]);
        var response = await AppService.instance.createData(
            objectModel: addToCartModel, path: ServicePath.addToCart);
        if (response == true) {
          emit(state.copyWith(isAddToCart: true));
        } else {
          emit(state.copyWith(isAddToCart: false));
        }
      }
    } catch (e) {
      log("Add To Cart Error : $e");
      emit(state.copyWith(isAddToCart: false));
    }
    log(state.isAddToCart.toString());
  }

  void getReviewsLeght() {
    int? productLeght = (state.product?.reviews?.length ?? 0) <= 2
        ? state.product?.reviews?.length
        : 2;
    emit(state.copyWith(productLength: productLeght));
  }

  void seeAllReviews({bool? isSeeAll}) {
    if (isSeeAll == true) {
      int? productLeght = state.product?.reviews?.length;
      emit(state.copyWith(productLength: productLeght));
    } else {
      getReviewsLeght();
    }
  }
}
