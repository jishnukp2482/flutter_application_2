import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:flutter_application_2/src/user/data/repository/user_repository.dart';
import 'package:flutter_application_2/src/user/domain/repositories/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_all_users_usecase.g.dart';

class FetchAllUsersUsecase {
  final UserRepository userRepository;

  FetchAllUsersUsecase(this.userRepository);
  Future<FetchAllUserResponse> build() {
    return userRepository.fetchAllusers();
  }
}
@riverpod
FetchAllUsersUsecase getFetchAllUsersUsecase(Ref ref) {
  final userRepository = ref.read(getUserRepositoryProvider);
  return FetchAllUsersUsecase(userRepository);
}
