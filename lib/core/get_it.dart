import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/domain/repository/user_repository.dart';
import 'package:test_app/domain/requests/user_client.dart';
import 'package:test_app/domain/usecase/get_all_users_use_case.dart';
import 'package:test_app/presentation/bloc/bloc/user_bloc.dart';

import '../domain/repository/user_repository_impl.dart';

import 'package:test_app/domain/models/hive/company_hive.dart';
import 'package:test_app/domain/models/hive/geo_hive.dart';
import 'package:test_app/domain/models/hive/address_hive.dart';
import 'package:test_app/domain/models/hive/user_hive.dart';

Future<void> setup() async {
  final sl = GetIt.I;
  final Directory docDir = await getApplicationDocumentsDirectory();
  Hive.init(docDir.path);
  Hive
    ..registerAdapter(GeoHiveAdapter())
    ..registerAdapter(CompanyHiveAdapter())
    ..registerAdapter(AddressHiveAdapter())
    ..registerAdapter(UserHiveAdapter());

  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 3),
    receiveTimeout: const Duration(seconds: 3),
  );
  sl.registerSingleton<Dio>(Dio(options));

  sl.registerSingleton<Box<UserHive>>(await Hive.openBox<UserHive>('userBox'));

  sl.registerSingleton<UserClient>(UserClient(sl()));

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl(), sl()));

  sl.registerSingleton<GetAllUsersUseCase>(GetAllUsersUseCase(sl()));

  sl.registerFactory<UserBloc>(() => UserBloc(sl()));
}
