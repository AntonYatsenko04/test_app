import 'package:hive/hive.dart';

part 'geo_hive.g.dart';

@HiveType(typeId: 0)
class GeoHive extends HiveObject {
  @HiveField(0)
  final String lat;

  @HiveField(1)
  final String lng;

  GeoHive({
    required this.lat,
    required this.lng,
  });
}
