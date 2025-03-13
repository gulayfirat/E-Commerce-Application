import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/search/viewModel/search_state.dart';

import '../../../core/enums/loading_status.dart';
import '../../../core/enums/service_path.dart';
import '../../../model/productModel/product_model.dart';
import '../../../service/networkService/app_service.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState()) {
    Future.microtask(() async {
      try {
        emit(state.copyWith(loadingStatus: LoadingStatus.loading));
        await getProducts();
        emit(state.copyWith(loadingStatus: LoadingStatus.success));
      } catch (e) {
        emit(state.copyWith(loadingStatus: LoadingStatus.failure));
      }
    });
  }

  FocusNode focusNode = FocusNode();

  Future<void> getProducts({String? query}) async {
    try {
      final List<ProductModel>? products =
          await AppService.instance.getListData(
        objectModel: ProductModel(),
        onResponsePath: ServicePath.productOnResponse.subUrl,
        path: query == null
            ? ServicePath.products.subUrl
            : "${ServicePath.searchProduct.subUrl}$query",
      );
      emit(state.copyWith(products: products));
      print(state.products);
    } catch (e) {
      print("getProducts Error: $e");
    }
  }

  Future<void> searchProduct({required String query}) async {
    if (query != "") {
      getProducts(query: query);
    }
  }
}
