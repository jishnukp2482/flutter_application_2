import 'package:flutter_application_2/src/user/data/models/response/fetch_all_user_res_modal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading,
   List <FetchAllUserResponse>? fetchAllUserResponse,
    String? error,
  }) = _UserState;
  factory UserState.initial() => UserState();
}
