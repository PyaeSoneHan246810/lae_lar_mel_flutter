// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_option_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizOptionAdapter extends TypeAdapter<QuizOption> {
  @override
  final int typeId = 6;

  @override
  QuizOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizOption(
      text: fields[0] as String,
      isCorrect: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuizOption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
