import 'package:e_commerce_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel extends BaseModel {
  final int? id;
  final String? title;
  final double? price;
  late final int? quantity;
  final double? total;
  final double? discountPercentage;
  final double? discountedTotal;
  final String? thumbnail;

  CartProductModel({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });
  @override
  CartProductModel fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CartProductModelToJson(this);
  CartProductModel copyWith({
    int? id,
    String? title,
    double? price,
    int? quantity,
    double? total,
    double? discountPercentage,
    double? discountedTotal,
    String? thumbnail,
  }) =>
      CartProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountedTotal: discountedTotal ?? this.discountedTotal,
        thumbnail: thumbnail ?? this.thumbnail,
      );
}
