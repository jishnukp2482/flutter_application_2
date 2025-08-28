import 'package:dio/dio.dart';
import 'package:flutter_application_2/src/core/constants/app_routes.dart';
import 'package:flutter_application_2/src/core/netwrok/dio_provider.dart';
import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String? baseUrl}) = _UserApiClient;
  @GET(AppRemoteRoutes.fetchAllUsers)
  Future<List<FetchAllUserResponse>> fetchAllusers();
}

@riverpod
UserApiClient getUserApiClient(Ref ref) {
  final dioProvider = ref.read(getDioProviderProvider);
  return UserApiClient(dioProvider.dio);
}
