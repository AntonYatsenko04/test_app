// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'user_bloc.dart';

enum UserStatus { initial, loading, onlineSuccess, offlineSuccess, failure }

final class UserState extends Equatable {
  const UserState({
    this.users = const <UserModel>[],
    this.status = UserStatus.initial,
  });

  final List<UserModel> users;
  final UserStatus status;

  UserState copyWith({
    List<UserModel>? users,
    UserStatus? status,
  }) {
    return UserState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [users, status];

  @override
  bool get stringify => true;
}
