import 'package:e_commerce_app/core/enums/loading_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../model/productModel/product_model.dart';
import '../../../model/userModel/user_model.dart';

@immutable
class HomeState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<String>? categories;
  final String? selectedCategory;
  final List<ProductModel>? products;
  final UserModel? user;

  HomeState(
      {this.loadingStatus = LoadingStatus.initial,
      this.categories,
      this.products,
      this.selectedCategory,
      this.user});

  @override
  List<Object?> get props =>
      [loadingStatus, categories, products, selectedCategory, user];

  HomeState copyWith(
      {LoadingStatus? loadingStatus,
      List<String>? categories,
      String? selectedCategory,
      List<ProductModel>? products,
      UserModel? user}) {
    return HomeState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        categories: categories ?? this.categories,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        products: products ?? this.products,
        user: user ?? this.user);
  }
}
