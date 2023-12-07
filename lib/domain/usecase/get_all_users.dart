// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_app/domain/models/user_model.dart';
import 'package:test_app/domain/repository/user_repository.dart';

class GetAllUsers {
  final UserRepository userRepository;

  GetAllUsers({
    required this.userRepository,
  });

  Future<List<UserModel>> call() async {
    return await userRepository.getAllUsers();
  }
}
