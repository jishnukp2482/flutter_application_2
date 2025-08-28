import 'package:flutter_application_2/src/user/data/datasources/user_data_source.dart';
import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:flutter_application_2/src/user/data/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_repository_impl.g.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<FetchAllUserResponse> fetchAllusers() async {
    return await userDataSource.fetchAllusers();
  }
}

@riverpod
UserRepository getUserRepository(Ref ref) {
  final userDataSource = ref.read(getUserDataSourceProvider);
  return UserRepositoryImpl(userDataSource);
}
