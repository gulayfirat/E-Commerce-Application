// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCacheModelAdapter extends TypeAdapter<UserCacheModel> {
  @override
  final int typeId = 1;

  @override
  UserCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheModel(
      id: fields[0] as int?,
      token: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCacheModel _$UserCacheModelFromJson(Map<String, dynamic> json) =>
    UserCacheModel(
      id: (json['id'] as num?)?.toInt(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserCacheModelToJson(UserCacheModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
