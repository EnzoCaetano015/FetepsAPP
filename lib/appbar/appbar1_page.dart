import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppBar1_page extends StatelessWidget implements PreferredSizeWidget {
  final double screenWidth;
  final Widget destinationPage;

  AppBar1_page({required this.screenWidth, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  child: destinationPage,
                  type: PageTransitionType.topToBottom,
                ),
              );
            },
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Icon(
                size: screenWidth * 0.075,
                Icons.arrow_back_sharp,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, bottom: 15),
            child: Image.asset(
              'lib/assets/logo3.png',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          )
        ],
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              size: screenWidth * 0.095,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
