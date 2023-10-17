// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseMaterialAdapter extends TypeAdapter<CourseMaterial> {
  @override
  final int typeId = 3;

  @override
  CourseMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseMaterial(
      courseMaterialId: fields[0] as int,
      courseMaterialType: fields[1] as CourseMaterialType,
      courseMaterialTitle: fields[2] as String,
      durationInMinute: fields[3] as double?,
      content: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CourseMaterial obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.courseMaterialId)
      ..writeByte(1)
      ..write(obj.courseMaterialType)
      ..writeByte(2)
      ..write(obj.courseMaterialTitle)
      ..writeByte(3)
      ..write(obj.durationInMinute)
      ..writeByte(4)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}