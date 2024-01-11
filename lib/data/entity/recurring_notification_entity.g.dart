// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_notification_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecurringNotificationEntityAdapter
    extends TypeAdapter<RecurringNotificationEntity> {
  @override
  final int typeId = 2;

  @override
  RecurringNotificationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurringNotificationEntity(
      id: fields[0] as int,
      message: fields[1] as String,
      colorIndex: fields[2] as int?,
      iconIdIndex: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RecurringNotificationEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.colorIndex)
      ..writeByte(3)
      ..write(obj.iconIdIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringNotificationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
