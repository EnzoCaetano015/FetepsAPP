import 'package:feteps/Menu_Page.dart';
import 'package:feteps/projetos_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalheProjectPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const DetalheProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 0,
          child: Scaffold(
            appBar: AppBar(
          title: SizedBox(
            width: screenWidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Color(0xFF0E414F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.015,
                      left: screenWidth * 0.025,
                      right: screenWidth * 0.025),
                  child: Image.asset(
                    'lib/assets/logo.png',
                    width: screenWidth * 0.7,
                  ),
                )
              ],
            ),
          ),
        ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.03),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ODS 2: Fome Zero', // Não consegui puxar
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(220, 255, 209, 64),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.045),
                          child: Image.asset(
                            'lib/assets/Rectangle.png',
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.045),
                          child: Text(
                            project['name_project'],
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.065,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.045),
                          child: Text(
                            'Resumo',
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.047,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 208, 20, 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.045),
                          child: Text(
                            project['project_abstract'],
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.04,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          height: screenHeight * 0.02,
                          thickness: 2,
                          indent: screenWidth * 0.05,
                          endIndent: screenWidth * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          child: Text(
                            "Integrantes",
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.047,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: screenWidth * 0.03,
                          runSpacing: screenWidth * 0.05,
                          alignment: WrapAlignment.spaceAround,
                          children: [
                            for (int i = 1; i <= 5; i++) iconPerson(i: i),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class iconPerson extends StatelessWidget {
  final int i;

  iconPerson({required this.i});

  String text(i) {
    if (i < 5) {
      return " Participante $i "; // Não consegui puxar
    } else {
      return " Orientador ";
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        FaIcon(
          FontAwesomeIcons.userCircle,
          size: screenWidth * 0.125,
        ),
        Text(
          text(i),
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.036,
            color: const Color.fromARGB(255, 14, 56, 70),
          ),
        )
      ],
    );
  }
}
