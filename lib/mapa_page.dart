import 'package:feteps/Menu_Page.dart';
import 'package:feteps/appbar/appbar1_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        ),
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar1_page(screenWidth: screenWidth, destinationPage: const SobrePage()),
              endDrawer: const MenuPage(),
              body: ListView(children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.025),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      child: Row(
                        children: [
                          Text(
                            'Mapa',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InteractiveViewer(
                            panEnabled: true,
                            minScale: 0.5,
                            maxScale: 6.0,
                            child: Image.asset(
                              'lib/assets/MapaFeira.png',
                              width: screenWidth * 0.9,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CA146),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'Estande de Apoiadores',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: const BoxDecoration(
                              color: Color(0xFFB6382B),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'Estande dos estudantes\n(Cada espaço com 4 estandes)',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.02),
                            child: Image.asset(
                              'lib/assets/Mapa.png',
                              width: screenWidth * 0.55,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ]),
            )));
  }
}
