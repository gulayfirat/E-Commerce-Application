import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:e_commerce_app/core/enums/service_path.dart';
import 'package:e_commerce_app/product/statics/app_statics.dart';
import 'package:e_commerce_app/service/networkService/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/home/viewModel/home_state.dart';
import '../../../model/productModel/product_model.dart';
import '../../../model/userModel/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    Future.microtask(() async {
      try {
        emit(state.copyWith(loadingStatus: LoadingStatus.loading));
        await getCategories();
        await getProducts();
        emit(state.copyWith(loadingStatus: LoadingStatus.success));
      } catch (e) {
        emit(state.copyWith(loadingStatus: LoadingStatus.failure));
      }
    });
  }

  FocusNode focusNode = FocusNode();

  Future<void> getCategories() async {
    try {
      final List<String> categories = await AppService.instance
          .getListData(path: ServicePath.categories.subUrl);
      emit(state.copyWith(
          categories: categories, selectedCategory: categories.first));
    } catch (e) {
      print("getCategories Error: $e");
    }
  }

  Future<void> getProducts({String? category}) async {
    try {
      final List<ProductModel>? products = await AppService.instance
          .getListData(
              objectModel: ProductModel(),
              onResponsePath: ServicePath.productOnResponse.subUrl,
              path: category == null
                  ? ServicePath.products.subUrl
                  : "${ServicePath.productsCategory.subUrl}$category");
      emit(state.copyWith(products: products));
      print(state.products);
    } catch (e) {
      print("getProducts Error: $e");
    }
  }

  void selectCategory({required String category}) {
    if (category != "") {
      emit(state.copyWith(selectedCategory: category));
      getProducts(category: state.selectedCategory);
    }
  }

  Future<void> getUser() async {
    try {
      if (AppStatics.user?.id != null) {
        UserModel _user = await AppService.instance.getObjectData(
            objectModel: UserModel(), path: ServicePath.user.subUrl);
        emit(state.copyWith(user: _user));
      } else {
        emit(state.copyWith(user: UserModel()));
      }
    } catch (e) {
      print("getUser Error $e");
    }
  }
}
