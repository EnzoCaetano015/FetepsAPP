import 'package:feteps/instituicoes_page.dart';
import 'package:feteps/reservas/Menu_Page.dart';
import 'package:feteps/sobrenos_page.dart';
import 'package:feteps/telainicial_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({super.key});

  @override
  State<SobrePage> createState() => _SobrePageState();
}

//AJUSTES NA RESPONSIVIDADE
class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: SizedBox(
                width: 400,
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 30),
                      child: Image.asset(
                        'lib/assets/logo.png',
                        width: MediaQuery.of(context).size.width * 0.65,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Padding(
                        padding: EdgeInsets.only(
                          top: 9.5,
                        ),
                        child: Icon(
                          Icons.menu,
                          size: MediaQuery.of(context).size.width * 0.095,
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
            endDrawer: MenuPage(),
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/assets/banner2.png',
                        width: MediaQuery.of(context).size.width * 1.0,
                      )
                    ],
                  ),
                ),
                TabBar(
                  indicatorColor: Color(0xFFFFD35F),
                  labelColor: Colors.black,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.043,
                      fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'Feteps'),
                    Tab(text: 'Programação'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.32,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'lib/assets/estudantes.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'A Feteps é um evento que reúne\nprojetos desenvolvidos por alunos do\nCentro Paula Souza\ne outras instituições participantes.\nCom projetos inovadores,de\ntransformação social, tecnológicos\n e criativos.\nA diversidade e a qualidade dos\ntrabalhos demonstram a excelência\ndos projetos pedagógicos do ensino médio,\ncursos técnicos de nível médio\ne superior tecnológico.\nA Feteps tem como objetivo desenvolver\n a visão empreendedora, criativa, inovadora\ne científico-tecnológica dos alunos.',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Leia Mais",
                                      style: GoogleFonts.poppins(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.045,
                                        color: const Color(0xFFB6382B),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration
                                            .underline, // Adiciona sublinhado ao texto
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ), // Conteúdo da primeira guia
                      ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.32,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/calendario.jpg',
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ), // Conteúdo da segunda guia
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> sair() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}
