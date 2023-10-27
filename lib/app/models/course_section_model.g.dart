// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseSectionAdapter extends TypeAdapter<CourseSection> {
  @override
  final int typeId = 3;

  @override
  CourseSection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseSection(
      courseSectionTitle: fields[0] as String,
      courseMaterials: (fields[1] as List).cast<CourseMaterial>(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseSection obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.courseSectionTitle)
      ..writeByte(1)
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
