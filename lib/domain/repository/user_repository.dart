import '../models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUser(int id);
}
