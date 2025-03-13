import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'addCartProductModel/add_cart_product_model.dart';
part 'add_to_cart_model.g.dart';

@JsonSerializable()
class AddToCartModel extends BaseModel {
  final int? userId;
  final List<AddCartProductModel>? products;

  AddToCartModel({
    this.userId,
    this.products,
  });
  @override
  AddToCartModel fromJson(Map<String, dynamic> json) =>
      _$AddToCartModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AddToCartModelToJson(this);

  AddToCartModel copyWith({
    int? userId,
    List<AddCartProductModel>? products,
  }) =>
      AddToCartModel(
        userId: userId ?? this.userId,
        products: products ?? this.products,
      );
}
