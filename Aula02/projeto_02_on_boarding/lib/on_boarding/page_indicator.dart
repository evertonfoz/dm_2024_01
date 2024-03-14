import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final PageController? pageController;

  const PageIndicator({
    super.key,
    required this.currentPage,
    this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDotIndicator(index: 0),
        _buildDotIndicator(index: 1),
        _buildDotIndicator(index: 2),
      ],
    );
  }

  _buildDotIndicator({required int index}) {
    final bool isCurrentPage = currentPage == index;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.black,
        onTap: () {
          if (pageController != null) {
            pageController!.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
        child: Container(
          width: isCurrentPage ? 20 : 10,
          height: isCurrentPage ? 20 : 10,
          decoration: BoxDecoration(
            color: isCurrentPage ? Colors.indigo : Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
