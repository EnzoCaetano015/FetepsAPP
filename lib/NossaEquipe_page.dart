import 'package:feteps/NossaEquipe/Breno_page.dart';
import 'package:feteps/NossaEquipe/Caetano_page.dart';
import 'package:feteps/NossaEquipe/Cintia_page.dart';
import 'package:feteps/NossaEquipe/Krebs_page.dart';
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
      "name": "Cíntia Pinho",
      "email": "Orientadora",
      "image": "lib/assets/cintia.jpg",
      "page": "CintiaPinhoPage"
    },
    {
      "name": "Anderson Vanin",
      "email": "Orientador",
      "image": "lib/assets/Rectangle.png",
      "page": "AndersonVaninPage"
    }
  ];

  final List<Map<String, String>> desenvolvimentoWeb = [
    {
      "name": "Breno Cardozo",
      "email": "Backend/Frontend",
      "image": "lib/assets/breno.png",
      "page": "BrenoCardozoPage"
    },
    {
      "name": "Bob",
      "email": "",
      "image": "lib/assets/Rectangle.png",
      "page": "BobPage"
    },
    {
      "name": "Charlie",
      "email": "",
      "image": "lib/assets/Rectangle.png",
      "page": "CharliePage"
    },
    {
      "name": "David",
      "email": "",
      "image": "lib/assets/Rectangle.png",
      "page": "DavidPage"
    }
  ];

  final List<Map<String, String>> desenvolvimentoMobile = [
    {
      "name": "Enzo Caetano",
      "email": "Backend/Frontend",
      "image": "lib/assets/caetano.jpg",
      "page": "EnzoCaetanoPage"
    },
    {
      "name": "Enzo Krebs Silva",
      "email": "Backend",
      "image": "lib/assets/Krebs.jpg",
      "page": "EnzoKrebsPage"
    },
    {
      "name": "Grace",
      "email": "",
      "image": "lib/assets/Rectangle.png",
      "page": "GracePage"
    },
    {
      "name": "Hank",
      "email": "",
      "image": "lib/assets/Rectangle.png",
      "page": "HankPage"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
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
                  _buildProjectSection('Orientador(a)', orientadores),
                  SizedBox(height: screenHeight * 0.01),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.5,
                  ),
                  _buildProjectSection(
                      'Desenvolvimento web', desenvolvimentoWeb),
                  SizedBox(height: screenHeight * 0.01),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.5,
                  ),
                  _buildProjectSection(
                      'Desenvolvimento mobile', desenvolvimentoMobile),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectSection(
      String title, List<Map<String, String>> teamMembers) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.025),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.07,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.0125),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: title == 'Orientador(a)'
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: List.generate(teamMembers.length, (index) {
              return _buildCard(teamMembers[index], index);
            }),
          ),
        ),
      ],
    );
  }

  void _navigateToPage(String page, BuildContext context) {
    switch (page) {
      case 'CintiaPinhoPage':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CintiaPinhoPage()));
        break;
      case 'BrenoCardozoPage':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BrenoCardozoPage()));
        break;
       case 'EnzoCaetanoPage':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnzoCaetanoPage()));
        break;
         case 'EnzoKrebsPage':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EnzoKrebsPage()));
        break;
    }
  }

  Widget _buildCard(Map<String, String> member, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = [const Color(0xFF1A5B97), const Color(0xFFFFD35F)];
    final color = colors[index % colors.length];

    return GestureDetector(
      onTap: () {
        _navigateToPage(member['page']!, context);
      },
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.0125),
        child: Card(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.025),
          ),
          child: SizedBox(
            width: screenWidth * 0.45,
            height: screenHeight * 0.3,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.015),
                    Center(
                      child: Container(
                        height: screenHeight * 0.15,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2.5,
                        )),
                        child: Image.asset(
                          member['image']!,
                          width: screenWidth * 0.35,
                          height: screenHeight * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.0075),
                    Text(
                      member['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.003),
                    Text(
                      member['email']!,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Positioned(
                  bottom: screenHeight * 0.015,
                  right: screenWidth * 0.025,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: screenWidth * 0.045,
                      color: color,
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


