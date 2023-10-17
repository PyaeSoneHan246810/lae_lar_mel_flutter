// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseSectionAdapter extends TypeAdapter<CourseSection> {
  @override
  final int typeId = 2;

  @override
  CourseSection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseSection(
      courseSectionId: fields[0] as int,
      courseSectionTitle: fields[1] as String,
      courseMaterials: (fields[2] as List).cast<CourseMaterial>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseSection obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.courseSectionId)
      ..writeByte(1)
      ..write(obj.courseSectionTitle)
      ..writeByte(2)
      ..write(obj.courseMaterials);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseSectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
