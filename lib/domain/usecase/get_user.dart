import 'package:flutter/material.dart';
import 'package:test_app/domain/models/user_model.dart';
import 'package:test_app/domain/repository/user_repository.dart';

class GetUser {
  final UserRepository userRepository;

  GetUser({
    required this.userRepository,
  });

  Future<UserModel> call({required int id}) async {
    return await userRepository.getUser(id);
  }
}
