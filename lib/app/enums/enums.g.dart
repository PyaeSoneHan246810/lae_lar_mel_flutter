// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseTypeAdapter extends TypeAdapter<CourseType> {
  @override
  final int typeId = 5;

  @override
  CourseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CourseType.free;
      case 1:
        return CourseType.premium;
      default:
        return CourseType.free;
    }
  }

  @override
  void write(BinaryWriter writer, CourseType obj) {
    switch (obj) {
      case CourseType.free:
        writer.writeByte(0);
        break;
      case CourseType.premium:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CourseMaterialTypeAdapter extends TypeAdapter<CourseMaterialType> {
  @override
  final int typeId = 6;

  @override
  CourseMaterialType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CourseMaterialType.video;
      case 1:
        return CourseMaterialType.document;
      case 2:
        return CourseMaterialType.quiz;
      default:
        return CourseMaterialType.video;
    }
  }

  @override
  void write(BinaryWriter writer, CourseMaterialType obj) {
    switch (obj) {
      case CourseMaterialType.video:
        writer.writeByte(0);
        break;
      case CourseMaterialType.document:
        writer.writeByte(1);
        break;
      case CourseMaterialType.quiz:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseMaterialTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
