// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'package:test_app/core/data_state.dart';
import 'package:test_app/domain/requests/user_client.dart';

import '../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserClient _userClient;
  final Box<UserModel> _userBox;
  UserRepositoryImpl(this._userClient, this._userBox);
  @override
  Future<DataState<List<UserModel>>> getAllUsers() async {
    try {
      final users = await _userClient.getAllUsers();
      return DataSuccess(users);
    } on DioException catch (e) {
      if (_userBox.values.isEmpty) {
        throw Exception("No offline data found");
      }
      final users = _userBox.values.toList();
      return DataOffline(users, e);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<UserModel>> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
