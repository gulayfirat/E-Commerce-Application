import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/loading_status.dart';
import '../../../model/productModel/product_model.dart';

@immutable
class ProductDetailState extends Equatable {
  final LoadingStatus loadingStatus;
  final bool? isAddToCart;
  final List<ProductModel>? products;
  final ProductModel? product;
  final int? productLength;
  const ProductDetailState({
    this.loadingStatus = LoadingStatus.initial,
    this.isAddToCart,
    this.product,
    this.products,
    this.productLength,
  });

  List<Object?> get props =>
      [loadingStatus, isAddToCart, product, products, productLength];

  ProductDetailState copyWith({
    LoadingStatus? loadingStatus,
    bool? isAddToCart,
    ProductModel? product,
    String? selectedCategory,
    List<ProductModel>? products,
    int? productLength,
  }) {
    return ProductDetailState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      isAddToCart: isAddToCart ?? this.isAddToCart,
      product: product ?? this.product,
      products: products ?? this.products,
      productLength: productLength ?? this.productLength,
    );
  }
}
