import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'cartProductModel/cart_product_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends BaseModel {
  final int? id;
  final List<CartProductModel>? products;
  final int? total;
  final int? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  CartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  @override
  CartModel fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
  @override
  Map<String, dynamic>? toJson() => _$CartModelToJson(this);

  CartModel copyWith({
    int? id,
    List<CartProductModel>? products,
    int? total,
    int? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) =>
      CartModel(
        id: id ?? this.id,
        products: products ?? this.products,
        total: total ?? this.total,
        discountedTotal: discountedTotal ?? this.discountedTotal,
        userId: userId ?? this.userId,
        totalProducts: totalProducts ?? this.totalProducts,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );
}
