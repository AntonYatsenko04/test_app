import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:test_app/core/data_state.dart';
import 'package:test_app/domain/models/hive/user_hive.dart';
import 'package:test_app/domain/requests/user_client.dart';

import '../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserClient _userClient;
  final Box<UserHive> _userBox;
  UserRepositoryImpl(this._userClient, this._userBox);
  @override
  Future<DataState<List<UserModel>>> getAllUsers() async {
    try {
      final users = await _userClient.getAllUsers();
      final List<UserHive> usersHive = users.map((e) => e.toHive()).toList();
      _userBox.clear();
      _userBox.addAll(usersHive);
      return DataSuccess(users);
    } on DioException catch (e) {
      if (_userBox.values.isEmpty) {
        return DataFailure(e);
      }
      final users = _userBox.values.map((e) => UserModel.fromHive(e)).toList();
      return DataOffline(users, e);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }
}
