import 'package:feteps/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class CuriosidadePage extends StatelessWidget {
  const CuriosidadePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const SobrePage(),
                                type: PageTransitionType.topToBottom),
                          );
                        },
                        icon: Icon(
                          size: MediaQuery.of(context).size.width * 0.075,
                          Icons.arrow_back_sharp,
                          color: const Color(0xFF0E414F),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.02,
                        ),
                        child: Image.asset(
                          'lib/assets/logo.png',
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.015,
                            ),
                            child: Icon(
                              Icons.menu,
                              size: MediaQuery.of(context).size.width * 0.095,
                              color: const Color(0xFF0E414F),
                            ),
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        );
                      },
                    ),
                  ],
                ),
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
                                  'Curiosidades',
                                  style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.085,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 14, 56, 70)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Curiosidades sobre a nossa feira!!',
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.047)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/curiosidade.png',
                                  width: screenWidth * 0.45,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Curiosidade 1',
                                        style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 14, 56, 70)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                  ),
                                  child: const Divider(
                                    thickness: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CuriosityCard(
                                          text:
                                              'Num ninho de mafagafos\nhá sete mafagafinhos.\nQuando a mafagafa gafa, gafam os \nsete mafagafinhos',
                                          screenWidth: screenWidth)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Curiosidade 2',
                                        style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 14, 56, 70)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                  ),
                                  child: const Divider(
                                    thickness: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CuriosityCard(
                                          text:
                                              'Num ninho de mafagafos\nhá sete mafagafinhos.\nQuando a mafagafa gafa, gafam os \nsete mafagafinhos',
                                          screenWidth: screenWidth)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Curiosidade 3',
                                        style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 14, 56, 70)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                  ),
                                  child: const Divider(
                                    thickness: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CuriosityCard(
                                          text:
                                              'Num ninho de mafagafos\nhá sete mafagafinhos.\nQuando a mafagafa gafa, gafam os \nsete mafagafinhos',
                                          screenWidth: screenWidth)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Curiosidade 4',
                                        style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 14, 56, 70)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                  ),
                                  child: const Divider(
                                    thickness: 1.5,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CuriosityCard(
                                          text:
                                              'Num ninho de mafagafos\nhá sete mafagafinhos.\nQuando a mafagafa gafa, gafam os \nsete mafagafinhos',
                                          screenWidth: screenWidth)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}

class CuriosityCard extends StatelessWidget {
  final String text;
  final double screenWidth;

  const CuriosityCard({
    super.key,
    required this.text,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: screenWidth * 0.045),
      ),
    );
  }
}
