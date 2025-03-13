import '../../../core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class Meta extends BaseModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });
  @override
  Meta fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$MetaToJson(this);

  Meta copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) =>
      Meta(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        barcode: barcode ?? this.barcode,
        qrCode: qrCode ?? this.qrCode,
      );
}
