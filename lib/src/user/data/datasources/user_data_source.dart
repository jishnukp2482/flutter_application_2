import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:flutter_application_2/src/user/data/service/user_api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_data_source.g.dart';

abstract class UserDataSource {
  Future<List<FetchAllUserResponse>> fetchAllusers();
}

class UserDataSourceImpl extends UserDataSource {
  final UserApiClient userApiClient;

  UserDataSourceImpl(this.userApiClient);

  @override
  Future<List<FetchAllUserResponse>> fetchAllusers() async {
    return await userApiClient.fetchAllusers();
  }
}

@riverpod
UserDataSource getUserDataSource(Ref ref) {
  final userApiClient = ref.read(getUserApiClientProvider);
  return UserDataSourceImpl(userApiClient);
}
