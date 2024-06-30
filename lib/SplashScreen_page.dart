import 'package:feteps/telainicial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:async';
import 'sobre_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

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

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    bool isLoggedIn = await verificarToken();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        PageTransition(child:  const SobrePage(), type: PageTransitionType.fade, duration: Duration(milliseconds: 2000 )),
      );
    } else {
      Navigator.pushReplacement(
        context,
         PageTransition(child:  const TelaInicialPage(), type: PageTransitionType.fade, duration: Duration(milliseconds: 2000 )),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF85491A),
              Color(0xFFA66736),
              Color(0xFFFFAA5F),
              Color(0xFFFFBF5F),
              Color(0xFFFFD35F),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ScaleTransition(
                  scale: _animation,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF85491A),
                          width: 3.5,
                        )),
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/fundo.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  )),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: EdgeInsets.only(bottom: screenHeight * 0.04),
            //     child: Image.asset('lib/assets/cps-logo.png',
            //         width: screenWidth * 0.2),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Future<bool> verificarToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString('token');

  if (token != null) {
    final url = Uri.parse(
        'https://profandersonvanin.com.br/appfeteps/pages/Auth/verifyToken.php');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future<Map<String, dynamic>?> getTokenData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? token = sharedPreferences.getString('token');

  if (token != null) {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return decodedToken;
    } catch (e) {
      print('Erro decoding token: $e');
      return null;
    }
  } else {
    return null;
  }
}
