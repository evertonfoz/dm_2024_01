import 'package:flutter/material.dart';

import 'page_03.dart';

class OnBoardingPage02 extends StatelessWidget {
  const OnBoardingPage02({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            color: Colors.blue,
            height: 250,
            width: double.infinity,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Seja bem-vindo à UTFPR',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                // SizedBox(
                //   height: 20,
                // ),
                Image.network(
                  'https://th.bing.com/th/id/R.3d53a122167671f14955623753d586e8?rik=mHNc3MppvzbHmQ&pid=ImgRaw&r=0',
                  width: 200,
                ),
                // SizedBox(
                //   height: 20,
                // ),
                const Text(
                  'Essa é a primeira tela do onboarding.',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
