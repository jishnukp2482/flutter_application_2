import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/src/core/constants/app_routes.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_provider.g.dart';

class DioProvider {
  late Dio dio;
  DioProvider() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppRemoteRoutes.baseUrl,
        headers: {"User-Agent": "Mozilla/5.0", "Accept": "application/json"},
      ),
    );
    dio.interceptors.add(
      LogInterceptor(logPrint: (object) => debugPrint(object.toString())),
    );
  }
}

@riverpod
DioProvider getDioProvider(Ref ref) {
  return DioProvider();
}
