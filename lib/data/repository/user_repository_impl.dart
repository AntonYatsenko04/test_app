import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:test_app/core/data_state.dart';
import 'package:test_app/data/mapper/user_mapper.dart';

import '../hive/user_hive.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repository/user_repository.dart';
import '../requests/user_client.dart';

class UserRepositoryImpl implements UserRepository {
  final UserClient _userClient;
  final Box<UserHive> _userBox;
  UserRepositoryImpl(this._userClient, this._userBox);
  @override
  Future<DataState<List<UserModel>>> getAllUsers() async {
    try {
      final users = await _userClient.getAllUsers();
      final List<UserHive> usersHive =
          users.map((e) => UserMapper.toHive(e)).toList();
      await _userBox.clear();
      await _userBox.addAll(usersHive);
      return DataSuccess(
          users.map((e) => UserMapper.entityToModel(e)).toList());
    } on DioException catch (e) {
      if (_userBox.values.isEmpty) {
        return DataFailure(e);
      }
      final users = _userBox.values
          .map((e) => UserMapper.entityToModel(UserMapper.fromHive(e)))
          .toList();
      return DataOffline(users, e);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }
}
