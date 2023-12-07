import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:test_app/domain/models/user_model.dart';
import 'package:test_app/domain/repository/user_repository.dart';
import 'package:test_app/domain/requests/user_client.dart';

import '../domain/repository/user_repository_impl.dart';

void setup() async {
  final box = await Hive.openBox<UserModel>('userBox');
  GetIt.I.registerSingleton<UserRepository>(
      UserRepositoryImpl(UserClient(GetIt.I<Dio>()), box));
  GetIt.I.registerSingleton<Dio>(Dio());
}
