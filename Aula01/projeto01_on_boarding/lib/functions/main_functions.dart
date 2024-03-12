import 'package:flutter/material.dart';

FloatingActionButton fab(Function? onPressed) {
  return FloatingActionButton(
    onPressed: onPressed as void Function()?,
    child: const Icon(Icons.add),
  );
}

Center body({required int counter}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Botão pressionado',
        ),
        Text(
          '$counter vezes.',
        ),
      ],
    ),
  );
}
