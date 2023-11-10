// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_instructor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseInstructorAdapter extends TypeAdapter<CourseInstructor> {
  @override
  final int typeId = 2;

  @override
  CourseInstructor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseInstructor(
      courseInstructorName: fields[0] as String,
      courseInstructorImage: fields[1] as String,
      courseInstructorMajor: fields[2] as String,
      courseInstructorDescription: fields[3] as String,
      courseInstructorCityAddress: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CourseInstructor obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.courseInstructorName)
      ..writeByte(1)
      ..write(obj.courseInstructorImage)
      ..writeByte(2)
      ..write(obj.courseInstructorMajor)
      ..writeByte(3)
      ..write(obj.courseInstructorDescription)
      ..writeByte(4)
      ..write(obj.courseInstructorCityAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseInstructorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
