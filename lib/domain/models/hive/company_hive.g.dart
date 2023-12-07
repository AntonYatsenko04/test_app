// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyHiveAdapter extends TypeAdapter<CompanyHive> {
  @override
  final int typeId = 3;

  @override
  CompanyHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyHive(
      name: fields[0] as String,
      catchPhrase: fields[1] as String,
      bs: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
