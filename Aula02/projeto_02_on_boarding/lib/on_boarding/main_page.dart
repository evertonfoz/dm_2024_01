import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_02_on_boarding/app_access/app_access.dart';
import 'package:projeto_02_on_boarding/on_boarding/page_01.dart';
import 'package:projeto_02_on_boarding/on_boarding/page_02.dart';
import 'package:projeto_02_on_boarding/on_boarding/page_03.dart';
import 'package:projeto_02_on_boarding/on_boarding/page_indicator.dart';

// scrcpy

class MainPageView extends StatefulWidget {
  final int lastPage = 2;

  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          // scrollDirection: Axis.vertical,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          children: const <Widget>[
            OnBoardingPage01(),
            OnBoardingPage02(),
            OnBoardingPage03(),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: PageIndicator(
              currentPage: _currentPage,
              pageController: _pageController,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _currentPage != 0,
                  child: FloatingActionButton(
                    heroTag: 'back',
                    onPressed: () {
                      _pageController.animateToPage(
                        _pageController.page!.toInt() - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ),
                if (_currentPage != widget.lastPage)
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppAccessPage.routeName),
                    child: const Text('Pular'),
                  ),
                if (_currentPage < widget.lastPage)
                  FloatingActionButton(
                    heroTag: 'forward',
                    onPressed: () {
                      _pageController.animateToPage(
                        _pageController.page!.toInt() + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                if (_currentPage == widget.lastPage)
                  FloatingActionButton(
                    heroTag: 'login',
                    onPressed: () {
                      Navigator.pushNamed(context, AppAccessPage.routeName);
                    },
                    child: const Icon(
                      Icons.login_rounded,
                      color: Colors.black,
                      size: 32,
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
