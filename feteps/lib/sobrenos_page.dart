import 'package:feteps/instituicoes_page.dart';
import 'package:feteps/reservas/menu.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreNosPage extends StatefulWidget {
  const SobreNosPage({super.key});

  @override
  State<SobreNosPage> createState() => _SobreNosPageState();
}

class _SobreNosPageState extends State<SobreNosPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SobrePage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: Color(0xFF0E414F),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 8, right: 0),
                      child: Image.asset(
                        'lib/assets/logo.png',
                        width: 220,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 9.5),
                        child: Icon(
                          Icons.menu,
                          size: 35,
                          color: Color(0xFF0E414F),
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
            endDrawer: CustomDrawer(),
            body: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(children: [
                Row(
                  children: [Image.asset('lib/assets/banner2.png', width: 360)],
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.black38,
                                  width: 1), // Define a linha de borda inferior
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sobre Nós',
                                style: GoogleFonts.poppins(
                                  fontSize: 20.0,
                                  color: const Color(0xFF0E414F),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Somos um grupo de alunos\ndedicados  e inovadores que uniram\nsuas paixões pela tecnologia e\neducação. Movidos pelo desejo de\nfazer a diferença, \ndesenvolvemos um aplicativo\npara a Feira Tecnológica\ndo Estado de São Paulo (Feteps).\nNossa jornada foi marcada por colaboração,\naprendizado e superação de desafios.\nEste aplicativo é o resultado\n do nosso comprometimento\nem proporcionar uma\nexperiência única aos participantes\n da Feteps, conectando pessoas,\nideias e tecnologia. Estamos orgulhosos\nde contribuir para o sucesso\ndeste evento e ansiosos para compartilhar\nessa jornada emocionante com vocês.',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/alunos.png',
                            width: 254,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            )));
  }
}
