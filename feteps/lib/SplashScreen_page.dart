import 'package:feteps/telainicial_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaInicialPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 95, 52, 27),
              Color.fromARGB(255, 255, 222, 138)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.3),
              child: Align(
                alignment: Alignment.topCenter,
                child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3.5,
                          )),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/fundo.png',
                          width: MediaQuery.of(context).size.width * 0.55,
                        ),
                      ),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                child: Image.asset('lib/assets/cps-logo.png',
                    width: screenWidth * 0.22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
