// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_time_notification_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneTimeNotificationEntityAdapter
    extends TypeAdapter<OneTimeNotificationEntity> {
  @override
  final int typeId = 1;

  @override
  OneTimeNotificationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneTimeNotificationEntity(
      id: fields[0] as String,
      time: fields[1] as DateTime,
      message: fields[2] as String,
      colorIndex: fields[3] as int?,
      iconIdIndex: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, OneTimeNotificationEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.colorIndex)
      ..writeByte(4)
      ..write(obj.iconIdIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneTimeNotificationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
