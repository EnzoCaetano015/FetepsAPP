// ignore_for_file: prefer_const_constructors

import 'package:feteps/Menu_Page.dart';
import 'package:feteps/appbar/appbar1_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatrocinadoresPage extends StatelessWidget {
  const PatrocinadoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
         debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0E414F))),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar1_page(screenWidth: screenWidth, destinationPage: SobrePage()),
            endDrawer: const MenuPage(),
            body: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: Row(
                          children: [
                            Text(
                              'Patrocinadores',
                              style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.085,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 14, 56, 70)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Patrocionadores da Feira Tecnológica\ndo Centro Paula Souza!',
                                style:
                                    TextStyle(fontSize: screenWidth * 0.048)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/dinheiro.png',
                            width: screenWidth * 0.45,
                          )
                        ],
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                        child: const Divider(
                          thickness: 1.5,
                          color: Colors.grey,
                        ),
                      ),
                      for (int row = 0; row < 4; row++)
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 2; i++)
                                CardWidget(
                                  index: row * 2 + i,
                                )
                            ],
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CardWidget extends StatelessWidget {
  final int index;
  const CardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isBlue = (index ~/ 2) % 2 == 0;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.012),
      child: Card(
        color: isBlue ? const Color(0xFF1A5B97) : const Color(0xFF830000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
        ),
        child: SizedBox(
          width: screenWidth * 0.42,
          height: screenHeight * 0.26,
          child: Center(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.015),
                    Image.asset(
                      'lib/assets/Rectangle.png',
                      width: screenWidth * 0.33,
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Nome do Patrocinador',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.035,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Contato',
                      style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.035,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Positioned(
                  bottom: screenHeight * 0.01,
                  right: screenWidth * 0.0,
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: screenWidth * 0.04,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
