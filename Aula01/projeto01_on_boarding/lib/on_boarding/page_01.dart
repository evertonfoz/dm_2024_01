import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto01_on_boarding/on_boarding/page_02.dart';

class OnBoardingPage01 extends StatelessWidget {
  const OnBoardingPage01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
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
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 10),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder<void>(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return OnBoardingPage02();
                          },
                          transitionsBuilder: (___, Animation<double> animation,
                              ____, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: RotationTransition(
                                turns: Tween<double>(begin: 0.5, end: 1.0)
                                    .animate(animation),
                                child: child,
                              ),
                            );
                          }));
                },
                child: const Icon(
                  Icons.arrow_forward,
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
