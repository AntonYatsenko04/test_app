import 'package:test_app/data/entity/geo_entity.dart';
import 'package:test_app/data/hive/geo_hive.dart';
import 'package:test_app/domain/models/geo_model.dart';

abstract class GeoMapper {
  static GeoHive toHive(GeoEntity geo) {
    return GeoHive(
      lat: geo.lat,
      lng: geo.lng,
    );
  }

  static GeoEntity fromHive(GeoHive geo) {
    return GeoEntity(
      lat: geo.lat,
      lng: geo.lng,
    );
  }

  static GeoEntity modelToEntity(GeoModel geo) {
    return GeoEntity(
      lat: geo.lat,
      lng: geo.lng,
    );
  }

  static GeoModel entityToModel(GeoEntity geo) {
    return GeoModel(
      lat: geo.lat,
      lng: geo.lng,
    );
  }
}
