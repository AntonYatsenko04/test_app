// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoHiveAdapter extends TypeAdapter<GeoHive> {
  @override
  final int typeId = 0;

  @override
  GeoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoHive(
      lat: fields[0] as String,
      lng: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GeoHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
