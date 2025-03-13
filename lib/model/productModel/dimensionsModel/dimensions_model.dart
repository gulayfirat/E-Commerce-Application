import '../../../core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dimensions_model.g.dart';

@JsonSerializable()
class Dimensions extends BaseModel {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });
  @override
  Dimensions fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DimensionsToJson(this);
  Dimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) =>
      Dimensions(
        width: width ?? this.width,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );
}
