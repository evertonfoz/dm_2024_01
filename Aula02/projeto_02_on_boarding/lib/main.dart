import 'package:flutter/material.dart';
import 'package:projeto_02_on_boarding/app_access/app_access.dart';
import 'package:projeto_02_on_boarding/on_boarding/main_page.dart';

void main() => runApp(const OnBoardingApp());

class OnBoardingApp extends StatelessWidget {
  const OnBoardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnBoarding App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('OnBoarding App'),
        ),
        body: const MainPageView(),
      ),
      routes: {
        // '/': (context) => const MainPageView(),
        AppAccessPage.routeName: (context) => const AppAccessPage(),
      },
    );
  }
}
