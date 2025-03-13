import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/enums/loading_status.dart';
import '../../../model/productModel/product_model.dart';

@immutable
class SearchState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<ProductModel>? products;

  const SearchState(
      {this.loadingStatus = LoadingStatus.initial, this.products});

  @override
  List<Object?> get props => [loadingStatus, products];

  SearchState copyWith(
      {LoadingStatus? loadingStatus,
      List<String>? categories,
      String? selectedCategory,
      List<ProductModel>? products}) {
    return SearchState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      products: products ?? this.products,
    );
  }
}
