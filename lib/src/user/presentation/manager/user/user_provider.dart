import 'package:flutter_application_2/src/user/domain/usecases/fetch_all_users_usecase.dart';
import 'package:flutter_application_2/src/user/presentation/manager/user/user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_provider.g.dart';

@riverpod
class UserProvider extends _$UserProvider {
  @override
  UserState build() {
    return UserState();
  }

  void fetchAllUsers() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchAllUsersUsecase = ref.read(getFetchAllUsersUsecaseProvider);
      var result = await fetchAllUsersUsecase.build();
      state = state.copyWith(isLoading: false, fetchAllUserResponse: result);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        fetchAllUserResponse: null,
        error: e.toString(),
      );
    }
  }
}
