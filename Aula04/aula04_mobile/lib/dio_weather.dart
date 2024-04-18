import 'dart:convert';

import 'package:aula04_mobile/cep_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<CepModel> getHttp({String? cep}) async {
  final Response response = await dio.get('http://10.55.0.4/');
  return CepModel.fromJson(response.data);
}
// Future<CepModel> getHttp({String? cep}) async {
// //   final Response response =
// //       await dio.get('https://viacep.com.br/ws/{$cep}/json/');
// //   return CepModel.fromJson(response.data);
