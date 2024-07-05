// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:feteps/participantes_page.dart';
import 'package:feteps/Menu_Page.dart';
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
        theme: ThemeData(),
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
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 30, bottom: 15),
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
                      icon: Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.095,
                        color: const Color(0xFF0E414F),
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
                  indicatorColor: const Color(0xFFFFD35F),
                  labelColor: Colors.black,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.043,
                  ),
                  tabs: const [
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/alunos.png',
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                  )
                                ],
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Programação:',
                                    style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.064,
                                      color: const Color(0xFF0E414F),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const EventTable(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/calendario.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                )
                              ],
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

class EventTable extends StatelessWidget {
  const EventTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF0E414F)),
      ),
      child: Table(
        columnWidths: {
          0: const FlexColumnWidth(1),
          1: const FlexColumnWidth(2),
        },
        children: [
          _buildTableRow(
            '10/10/2023\n25/03/2024',
            'Submissão dos Trabalhos [Prorrogado]',
            Color(0xFFFFD35F),
          ),
          _buildTableRow(
              '22/04/2024', 'Início da Etapa de Avaliação', Colors.white),
          _buildTableRow(
              '15/05/2024', 'Divulgação dos Finalistas', Color(0xFFFFD35F)),
          _buildTableRow('19, 20, 21 e 22/07/2024',
              'Feira Presencial: São Paulo Expo - Pavilhão 7', Colors.white),
        ],
      ),
    );
  }

  TableRow _buildTableRow(
      String date, String description, Color backgroundColor) {
    return TableRow(
      children: [
        Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(20.66), // Aumenta a altura da linha
          child: Text(
            date,
            style: TextStyle(
                fontSize: 13,
                color: Color(0xFF0E414F),
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(20.0), // Aumenta a altura da linha
          child: Text(
            description,
            style: TextStyle(
                color: Color(0xFF0E414F), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
