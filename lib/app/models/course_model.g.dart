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
      courseName: fields[1] as String,
      courseType: fields[2] as String,
      coursePriceInMMK: fields[3] as double,
      courseTotalDurationInHour: fields[4] as double,
      courseInstructor: fields[5] as CourseInstructor,
      courseLanguage: fields[6] as String,
      courseLevel: fields[7] as String,
      courseSkill: fields[8] as String,
      coursePreviewImage: fields[9] as String,
      coursePreviewVideo: fields[10] as String,
      courseSections: (fields[11] as List).cast<CourseSection>(),
    );
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.courseId)
      ..writeByte(1)
      ..write(obj.courseName)
      ..writeByte(2)
      ..write(obj.courseType)
      ..writeByte(3)
      ..write(obj.coursePriceInMMK)
      ..writeByte(4)
      ..write(obj.courseTotalDurationInHour)
      ..writeByte(5)
      ..write(obj.courseInstructor)
      ..writeByte(6)
      ..write(obj.courseLanguage)
      ..writeByte(7)
      ..write(obj.courseLevel)
      ..writeByte(8)
      ..write(obj.courseSkill)
      ..writeByte(9)
      ..write(obj.coursePreviewImage)
      ..writeByte(10)
      ..write(obj.coursePreviewVideo)
      ..writeByte(11)
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
