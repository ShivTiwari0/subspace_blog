// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_blog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBlogModelAdapter extends TypeAdapter<HiveBlogModel> {
  @override
  final int typeId = 0;

  @override
  HiveBlogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBlogModel(
      id: fields[0] as String?,
      imageUrl: fields[1] as String?,
      title: fields[2] as String?,
      isFavorite: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBlogModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBlogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
