import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingPage03 extends StatelessWidget {
  const OnBoardingPage03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 10),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
