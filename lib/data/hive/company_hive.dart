import 'package:hive/hive.dart';
part 'company_hive.g.dart';

@HiveType(typeId: 3)
class CompanyHive extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String catchPhrase;

  @HiveField(2)
  final String bs;

  CompanyHive({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });
}
