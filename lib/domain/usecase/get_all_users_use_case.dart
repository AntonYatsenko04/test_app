// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_app/domain/models/user_model.dart';
import 'package:test_app/domain/repository/user_repository.dart';
import 'package:test_app/domain/usecase/use_case.dart';

import '../../core/data_state.dart';

class GetAllUsersUseCase
    implements UseCase<Future<DataState<List<UserModel>>>, void> {
  final UserRepository _userRepository;

  GetAllUsersUseCase(this._userRepository);

  @override
  Future<DataState<List<UserModel>>> call({void params}) async {
    return await _userRepository.getAllUsers();
  }
}
