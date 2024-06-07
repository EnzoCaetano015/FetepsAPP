import 'package:feteps/Menu_Page.dart';
import 'package:feteps/projetos_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalheProjectPage extends StatelessWidget {
  const DetalheProjectPage({super.key, required Map<String, dynamic> project});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 0,
          child: Scaffold(
            appBar: AppBar(
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
                            MaterialPageRoute(
                              builder: (context) => const ProjetosPage(),
                            ),
                          );
                        },
                        icon: const Icon(
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
                  padding: const EdgeInsets.only(top: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ODS 2: Fome Zero',
                            style: GoogleFonts.inter(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(220, 255, 209, 64),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            'lib/assets/Rectangle.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Nome do Projeto',
                            style: GoogleFonts.inter(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Resumo',
                            style: GoogleFonts.inter(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 208, 20, 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut eros nec mi sodales ultrices. Integer vitae pulvinar nulla. Cras nec justo sed orci ultrices congue ac sit amet arcu. Mauris nec est vitae justo pharetra gravida. In ac justo at ligula dignissim hendrerit. Vestibulum convallis enim nec aliquet sollicitudin.',
                            style: GoogleFonts.inter(
                              fontSize: 15.0,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Integrantes",
                            style: GoogleFonts.inter(
                              fontSize: 18.0,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 20.0,
                          runSpacing: 20.0,
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
      return " Participante $i ";
    } else {
      return " Orientador ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FaIcon(
          FontAwesomeIcons.userCircle,
          size: 50.0,
        ),
        Text(
          text(i),
          style: GoogleFonts.inter(
            fontSize: 14.4,
            color: const Color.fromARGB(255, 14, 56, 70),
          ),
        )
      ],
    );
  }
}
