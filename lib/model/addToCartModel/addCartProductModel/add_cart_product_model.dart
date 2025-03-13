import 'package:json_annotation/json_annotation.dart';
import '../../../core/base/model/base_model.dart';
part 'add_cart_product_model.g.dart';

@JsonSerializable()
class AddCartProductModel extends BaseModel {
  final int? id;
  final int? quantity;

  AddCartProductModel({
    this.id,
    this.quantity,
  });

  @override
  AddCartProductModel fromJson(Map<String, dynamic> json) =>
      _$AddCartProductModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AddCartProductModelToJson(this);

  AddCartProductModel copyWith({
    int? id,
    int? quantity,
  }) =>
      AddCartProductModel(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
      );
}
