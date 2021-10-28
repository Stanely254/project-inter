import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:http/http.dart' as http;
import 'package:project/controllers/app_state_controller.dart';
import 'package:project/exceptions/app_exceptions.dart';

const enableDio = true;

void printLog([dynamic data, DateTime? startTime]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? 'Slow'
          : endTime.inMilliseconds > 1000
              ? 'Medium'
              : 'Fast';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final now = DateFormat('h:mm:ss-ms').format(DateTime.now());
      debugPrint('i[${now}ms]$time${data.toString()}');
      if (data.toString().contains('is not a subtype of type')) {
        throw Exception();
      }
    } catch (e, trace) {
      debugPrint(e.toString());
      debugPrint(trace.toString());
    }
  }
}

/// The default http GET that support Logging
Future<http.Response> httpGet(Uri url,
    {Map<String, String>? headers,
    ResponseType? responseType,
    int timeOutException = 20}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio()
          .get(url.toString(),
              options: Options(
                headers: headers,
                responseType: responseType,
              ))
          .timeout(Duration(seconds: timeOutException));
      printLog('GET:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        throw e.message;
      }
    } on TimeoutException {
      throw ApiNotRespospondingException('API not responding', url.toString());
    }
  } else {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (foundation.kIsWeb) {
      response = await http.get(url, headers: headers);
    } else {
      response = await http.get(url, headers: headers);
    }

    printLog('GET->> $url', startTime);
    return response;
  }
}

AppStateController state({required BuildContext context, bool listen = true}) =>
    AppStateController();

// ignore: non_constant_identifier_names
Size SIZE({required BuildContext context}) => MediaQuery.of(context).size;
