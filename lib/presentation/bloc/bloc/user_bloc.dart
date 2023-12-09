import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/data_state.dart';
import 'package:test_app/domain/models/user_model.dart';
import 'package:test_app/domain/usecase/get_all_users_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsersUseCase _getAllUsers;

  UserBloc(this._getAllUsers) : super(const UserState()) {
    on<FetchUsersEvent>(_onReloadEvent);
  }

  _onReloadEvent(event, emit) async {
    final usersDataState = await _getAllUsers();
    if (usersDataState is DataSuccess) {
      emit(state.copyWith(
          users: usersDataState.data, status: UserStatus.onlineSuccess));
    } else if (usersDataState is DataOffline) {
      emit(state.copyWith(
          users: usersDataState.data, status: UserStatus.offlineSuccess));
    } else {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
