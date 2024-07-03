import 'package:feteps/perfil_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:page_transition/page_transition.dart';

class AppBar2_page extends StatelessWidget implements PreferredSizeWidget {
  final double screenWidth;
  final Widget destinationPage;

  const AppBar2_page({super.key, required this.screenWidth, required this.destinationPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: 400,
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(child: destinationPage, type: PageTransitionType.leftToRight),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 15),
                child: Icon(
                  size: screenWidth * 0.075,
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
                bottom: 15,
              ),
              child: Image.asset(
                'lib/assets/logo3.png',
                width: MediaQuery.of(context).size.width * 0.65,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
