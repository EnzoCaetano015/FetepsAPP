import 'package:feteps/NossaEquipe/Andrey_page.dart';
import 'package:feteps/NossaEquipe/Breno_page.dart';
import 'package:feteps/NossaEquipe/Caetano_page.dart';
import 'package:feteps/NossaEquipe/Cintia_page.dart';
import 'package:feteps/NossaEquipe/Krebs_page.dart';
import 'package:feteps/NossaEquipe/Lele_page.dart';
import 'package:feteps/NossaEquipe/Luana_page.dart';
import 'package:feteps/NossaEquipe/Rapha_page.dart';
import 'package:feteps/NossaEquipe/Ribas_page.dart';
import 'package:feteps/NossaEquipe/carol_page.dart';
import 'package:feteps/sobrenos_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NossaEquipePage extends StatefulWidget {
  const NossaEquipePage({super.key});

  @override
  State<NossaEquipePage> createState() => _NossaEquipePageState();
}

class _NossaEquipePageState extends State<NossaEquipePage> {
  final List<Map<String, String>> orientadores = [
    {
      "name": "Cíntia",
      "image": "lib/assets/cintia.jpg",
      "page": "CintiaPinhoPage"
    },
    {
      "name": "Anderson",
      "image": "lib/assets/Rectangle.png",
      "page": "AndersonVaninPage"
    },
  ];

  final List<Map<String, String>> modelagemFigma = [
    {
      "name": "Carolina",
      "image": "lib/assets/carol.jpg",
      "page": "CarolinaPage"
    },
    {"name": "Leticia", "image": "lib/assets/lele.jpg", "page": "LeticiaPage"},
    {"name": "Luana", "image": "lib/assets/luana.jpg", "page": "LuanaPage"},
    {"name": "Raphaela", "image": "lib/assets/rapha.jpg", "page": "RaphaPage"},
  ];

  final List<Map<String, String>> desenvolvimentoMobile = [
    {
      "name": "Breno Cardozo",
      "image": "lib/assets/breno.png",
      "page": "BrenoCardozoPage"
    },
    {
      "name": "Enzo Caetano",
      "image": "lib/assets/caetano.jpg",
      "page": "EnzoCaetanoPage"
    },
    {
      "name": "Enzo Krebs",
      "image": "lib/assets/Krebs.jpg",
      "page": "EnzoKrebsPage"
    }
  ];

  final List<Map<String, String>> desenvolvimentoWeb = [
    {
      "name": "Breno",
      "image": "lib/assets/breno.png",
      "page": "BrenoCardozoPage"
    },
    {"name": "Ribas", "image": "lib/assets/ribas.png", "page": "RibasPage"}
  ];

  final List<Map<String, String>> desenvolvimentoBackend = [
    {
      "name": "Andrey",
      "image": "lib/assets/andrey.png",
      "page": "AndreyPage"
    }
  ];

  final List<Map<String, String>> ilustracoes = [
    {"name": "Richard", "image": "lib/assets/Rectangle.png", "page": "NomePage"}
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: screenWidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SobreNosPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    size: screenWidth * 0.075,
                    Icons.arrow_back_sharp,
                    color: const Color(0xFF0E414F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.015,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: Image.asset(
                    'lib/assets/logo.png',
                    width: screenWidth * 0.65,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: screenHeight * 0.12,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.025),
                          child: Text(
                            'Nossa Equipe',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.09,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildProjectSection(
                    'Orientadores',
                    orientadores,
                    const Color(0xFFFFD35F),
                  ),
                  _buildProjectSection('Modelagem Figma', modelagemFigma,
                      const Color.fromARGB(255, 112, 70, 132)),
                  _buildProjectSection('Desenvolvimento Mobile',
                      desenvolvimentoMobile, const Color(0xFF0E414F)),
                  _buildProjectSection('Desenvolvimento Web',
                      desenvolvimentoWeb, const Color(0xFF136A9F)),
                  _buildProjectSection('Desenvolvimento do back-end',
                      desenvolvimentoBackend, const Color(0xFFF26A2E)),
                  _buildProjectSection(
                      'Ilustrações', ilustracoes, const Color(0xFF830000)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectSection(
      String title, List<Map<String, String>> teamMembers, Color color) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.025),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.065,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.0125),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: title == 'Orientadores'
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: List.generate(teamMembers.length, (index) {
              return _buildCard(teamMembers[index], color);
            }),
          ),
        ),
      ],
    );
  }

  void _navigateToPage(String page, BuildContext context) {
    switch (page) {
      case 'CintiaPinhoPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CintiaPinhoPage()));
        break;
      case 'BrenoCardozoPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BrenoCardozoPage()));
        break;
      case 'EnzoCaetanoPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const EnzoCaetanoPage()));
        break;
      case 'EnzoKrebsPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const EnzoKrebsPage()));
        break;
      case 'CarolinaPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CarolinaPage()));
        break;
      case 'LeticiaPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LeticiaPage()));
        break;
      case 'LuanaPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LuanaPage()));
        break;
      case 'RaphaPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RaphaPage()));
        break;
         case 'RibasPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RibasPage()));
        break;
         case 'AndreyPage':
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AndreyPage()));
        break;
    }
  }

  Widget _buildCard(Map<String, String> member, Color borderColor) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _navigateToPage(member['page']!, context);
      },
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.0125),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 13),
            borderRadius: BorderRadius.circular(18),
          ),
          child: SizedBox(
            width: screenWidth * 0.5,
            height: screenHeight * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.07),
                  child: Image.asset(
                    member['image']!,
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.16,
                  ),
                ),
                Text(
                  member['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                    color: Colors.black,
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
