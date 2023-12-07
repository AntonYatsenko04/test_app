import 'package:retrofit/http.dart';
import 'package:test_app/core/constants.dart';
import 'package:test_app/data/entity/user_entity.dart';
import 'package:dio/dio.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('/users')
  Future<List<UserEntity>> getAllUsers();
}
