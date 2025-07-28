import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yara/pages/login.dart';

class AuthInterceptor extends dio.Interceptor {
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('accessToken');
    if (token != null && token.isNotEmpty) {
      options.headers["authorization"] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(
    dio.DioException err,
    dio.ErrorInterceptorHandler handler,
  ) async {
    if (err.response!.statusCode == 401) {
      final pref = await SharedPreferences.getInstance();
      final refreshToken = pref.get("refreshToken");
      if (refreshToken != null) {
        await pref.remove("isUserLoggedIn");
        await pref.remove('accessToken');
        await pref.remove('refreshToken');
        Get.offAll(Login());
      }
    }
    super.onError(err, handler);
  }
}
