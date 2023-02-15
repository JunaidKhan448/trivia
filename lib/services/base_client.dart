import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:trivia/services/api_exceptions.dart';
import '../app_resources/app_strings.dart';
import '../components/custom_snackbar.dart';

class BaseClient {
  static final Dio _dio = Dio();
  static const int TIME_OUT_DURATION = 50000; // in milliseconds

  // GET request
  static get(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function? onLoading,
  }) async {
    try {
      // 1) indicate loading state
      onLoading?.call();

      // 2) try to perform http request
      var response = await _dio
          .get(
            url,
            onReceiveProgress: onReceiveProgress,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioError catch (error) {


      onError?.call(ApiException(
        message: AppStrings.noInternet,
        url: url,
      )) ??
          _handleError(AppStrings.somethingWentWrong);
      // dio error (api reach the server but not performed successfully
      // no internet connection



    } on SocketException {
      // No internet connection
      onError?.call(ApiException(
            message: AppStrings.noInternet,
            url: url,
          )) ??
          _handleError(AppStrings.noInternet);
    } on TimeoutException {
      // Api call went out of time
      onError?.call(ApiException(
            message: AppStrings.serverErrorNotResponding,
            url: url,
          )) ??
          _handleError(AppStrings.serverErrorNotResponding);
    } catch (error) {
      // unexpected error for example (parsing json error)
      onError?.call(ApiException(
            message: error.toString(),
            url: url,
          )) ??
          _handleError(error.toString());
    }
  }


  /// handle error automatically (if user didn't pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason
  static handleApiError(ApiException apiException) {
    // TODO -> ADD YOUR API ERROR MESSAGE POSITION
    String msg =
        apiException.response?.data?['message'] ?? apiException.message;
    CustomSnackBar.showCustomErrorToast(message: msg);
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    CustomSnackBar.showCustomErrorToast(message: msg);
  }
}
