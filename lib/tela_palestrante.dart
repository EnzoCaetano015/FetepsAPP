import 'package:feteps/Menu_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final TextStyle interTextStyle = GoogleFonts.inter();

class tela_palestrante extends StatelessWidget {
  const tela_palestrante({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: 400,
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        size: MediaQuery.of(context).size.width * 0.075,
                        Icons.arrow_back_sharp,
                        color: Color(0xFF0E414F),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                    child: Image.asset(
                      'lib/assets/logo.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nome do palestrante',
                          style: GoogleFonts.inter(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 14, 56, 70),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.userCircle, size: 140.0)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Título da palestra',
                            style: GoogleFonts.inter(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0E414F),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            ' Resumo:',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 179, 0, 0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit. Sed ut eros nec mi sodales\nultrices. Integer vitae pulvinar nulla. Cras nec\njusto sed orci ultrices congue ac sit amet arcu.\nMauris nec est vitae justo pharetra gravida. In ac\njusto at ligula dignissim hendrerit. Vestibulum\nconvallis enim nec aliquet sollicitudin.',
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Outros Palestrantes:',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: const Color.fromARGB(255, 14, 56, 70),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(
                        color: Colors.black38,
                        thickness: 1,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 1; i < 18; i++) const CardWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(255, 179, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: 185.0,
          height: 240.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Image.asset('lib/assets/Rectangle.png'),
              const SizedBox(height: 5.0),
              const Text(
                'Nome do palestrante',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 3.0),
              const Text(
                'Descrição',
                style: TextStyle(
                    fontSize: 13.5, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
