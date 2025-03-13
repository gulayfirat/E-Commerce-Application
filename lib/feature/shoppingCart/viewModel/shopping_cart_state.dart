import 'package:e_commerce_app/model/cartModel/cart_model.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/loading_status.dart';

class ShoppingCartState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<CartModel>? carts;

  const ShoppingCartState(
      {this.loadingStatus = LoadingStatus.initial, this.carts});

  @override
  List<Object?> get props => [loadingStatus, carts];

  ShoppingCartState copyWith(
      {LoadingStatus? loadingStatus, List<CartModel>? carts}) {
    return ShoppingCartState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        carts: carts ?? this.carts);
  }
}
