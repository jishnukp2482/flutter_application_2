import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';

abstract class UserRepository {
  Future<List<FetchAllUserResponse>> fetchAllusers();
}
