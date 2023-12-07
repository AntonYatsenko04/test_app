import 'package:test_app/core/data_state.dart';

import '../models/user_model.dart';

abstract class UserRepository {
  Future<DataState<List<UserModel>>> getAllUsers();
  Future<DataState<UserModel>> getUser(int id);
}
