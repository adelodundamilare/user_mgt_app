import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:ryalize/models/model_http_error.dart';
import 'package:ryalize/utils/project_logger.dart';

abstract class HttpServices {
  Future<dynamic> getHttp(String route);
  Future<dynamic> postHttp(String route,
      {Map<String, dynamic>? data, String? token});
  Future<dynamic> putHttp(String route, {Map<String, dynamic>? data});
}

class HttpServicesImpl extends HttpServices {
  final _log = getLogger('http_service.dart');
  final _dio = Dio();
  final Options _options = Options(
    headers: {'Content-Type': 'application/json', 'x-platform-type': 'web'},
  );

  HttpServicesImpl() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  Future<dynamic> getHttp(String route) async {
    _log.w('>>>>>>>>>>>>> GET: $route');

    try {
      return await _dio
          .get(
            route,
            options: _options,
          )
          .then(_returnResponse);
    } on DioError catch (error) {
      throw _returnError(error);
    }
  }

  @override
  Future<dynamic> postHttp(String route,
      {Map<String, dynamic>? data, String? token}) async {
    _log.w('>>>>>>>>>>>>> POST" $route');
    _log.w('>>>>>>>>>>>>> Data: ${jsonEncode(data)}');
    _log.w('>>>>>>>>>>>>> Authorization: $token');

    try {
      return await _dio
          .post(
            route,
            data: jsonEncode(data),
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'x-platform-type': 'web',
                'Authorization': token ?? ''
              },
            ),
          )
          //   .then((Response response) {
          // return _returnResponse(response, cache: cache);
          .then(_returnResponse);
    } on DioError catch (error) {
      throw _returnError(error);
    }
  }

  @override
  Future putHttp(String route,
      {Map<String, dynamic>? data,
      int timeout = 50,
      bool retryWithCache = false,
      bool retry = false}) async {
    _log.w('>>>>>>>>>>>>> PUT" $route');
    _log.w('>>>>>>>>>>>>> Data: ${jsonEncode(data)}');
    try {
      return await _dio
          .put(
            route,
            data: jsonEncode(data),
            options: _options,
          )
          .then((_returnResponse));
      //     .then((Response response) {
      //   return _returnResponse(response);
      // });
    } on DioError catch (error) {
      throw _returnError(error);
    }
  }

  dynamic _returnResponse(Response response,
      {int timeout = 50, bool retryWithCache = false, bool retry = false}) {
    final dynamic res = response.data;
    final int statusCode = response.statusCode ?? 500;
    // _log.i('>>>>>>>>>>>>> response: ${res['error']}');
    // if (res['error'] != null) {
    //   throw res['error']
    //       .toString()
    //       .replaceRange(0, 1, res['error'][0].toString().toUpperCase());
    // }

    if (statusCode < 200 || statusCode > 400) {
      _log.e('==== FAILED ====');
      _log.e('>>>>>>>>>>>>> body $res');
      throw Exception('Error during request');
    }

    _log.i('==== SUCCESS ====');
    _log.i('>>>>>>>>>>>>> response: $res');
    return jsonDecode(res);
  }

  String _returnError(DioError error) {
    _log.e('==== DioError FAILED ====');
    _log.e('>>>>>>>>>>>>> error response ${error.response}');
    _log.e('>>>>>>>>>>>>> error message ${error.message}');

    try {
      var _res = ModelHttpError.fromJson(jsonDecode(error.response?.data));
      _log.e('>>>>>>>>>>>>> parsed error::: ${_res.message}');
      return _res.message ?? 'Something went wrong';
    } catch (_err) {
      _log.e('>>>>>>>>>>>>> catch HTTP error $_err');
      rethrow;
    }
  }
}
