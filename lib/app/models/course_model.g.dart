// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 1;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course(
      courseId: fields[0] as int,
      courseType: fields[1] as CourseType,
      courseImage: fields[2] as String,
      courseName: fields[3] as String,
      coursePriceInMMK: fields[4] as double,
      courseTotalDurationInHour: fields[5] as double,
      courseInstructorImage: fields[6] as String,
      courseInstructorName: fields[7] as String,
      courseInstructorMajor: fields[8] as String,
      courseInstructorDescription: fields[9] as String,
      courseLanguageCategory: fields[10] as String,
      courseLevel: fields[11] as String,
      courseSkill: fields[12] as String,
      coursePreviewVideo: fields[13] as String,
      courseSections: (fields[14] as List).cast<CourseSection>(),
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.courseId)
      ..writeByte(1)
      ..write(obj.courseType)
      ..writeByte(2)
      ..write(obj.courseImage)
      ..writeByte(3)
      ..write(obj.courseName)
      ..writeByte(4)
      ..write(obj.coursePriceInMMK)
      ..writeByte(5)
      ..write(obj.courseTotalDurationInHour)
      ..writeByte(6)
      ..write(obj.courseInstructorImage)
      ..writeByte(7)
      ..write(obj.courseInstructorName)
      ..writeByte(8)
      ..write(obj.courseInstructorMajor)
      ..writeByte(9)
      ..write(obj.courseInstructorDescription)
      ..writeByte(10)
      ..write(obj.courseLanguageCategory)
      ..writeByte(11)
      ..write(obj.courseLevel)
      ..writeByte(12)
      ..write(obj.courseSkill)
      ..writeByte(13)
      ..write(obj.coursePreviewVideo)
      ..writeByte(14)
      ..write(obj.courseSections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
