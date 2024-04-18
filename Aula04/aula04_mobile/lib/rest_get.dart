import 'package:aula04_mobile/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio_weather.dart';

class WeatherAPI extends StatefulWidget {
  const WeatherAPI({super.key});

  @override
  State<WeatherAPI> createState() => _WeatherAPIState();
}

class _WeatherAPIState extends State<WeatherAPI> {
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _cepController,
            decoration: const InputDecoration(
              labelText: 'CEP',
              hintText: 'Digite o CEP',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Buscar'),
          ),
          FutureBuilder<CepModel>(
            future: getHttp(cep: _cepController.text),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('none');
                case ConnectionState.waiting:
                  return const Text('waiting');
                case ConnectionState.active:
                  return const Text('active');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    if (snapshot.error is DioException) {
                      final dioError = snapshot.error as DioException;
                      if (dioError.response?.statusCode == 400 &&
                          _cepController.text.isEmpty) {
                        return const Text('CEP não informado');
                      }
                      return Text('Error: ${dioError.response?.statusCode}');
                    }
                    return Text('Error: ${snapshot.error}');
                  }
                  final cep = snapshot.data as CepModel;
                  return Text('Result: ${cep.logradouro}');
              }
            },
          ),
        ],
      ),
    );
  }
}
