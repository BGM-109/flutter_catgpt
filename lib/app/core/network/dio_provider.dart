// ignore_for_file: avoid_print

import 'package:cat_gpt/app/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_provider.g.dart';

@riverpod
Dio gptDio(GptDioRef ref) {
  const apiKey = Constants.apiKey;
  final options = BaseOptions(baseUrl: Constants.baseUrl, headers: {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json'
  });
  final dio = Dio(options);
  return dio;
}
