import 'package:feteps/telainicial_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'altsenha_page.dart';
import 'package:feteps/atualizaperfil_page.dart';
import 'package:feteps/home_page.dart';
import 'package:feteps/reservas/menu.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 10,
                  ),
                  child: Image.asset(
                    'lib/assets/logo.png',
                    width: MediaQuery.of(context).size.width * 0.6,
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
                    padding: const EdgeInsets.only(
                      top: 9.5,
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
        endDrawer: CustomDrawer(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.06),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.115,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'PERFIL',
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.069,
                            color: const Color(0xFF0E414F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.175,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'lib/assets/user2.png',
                              width: screenWidth * 0.3,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.14,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.025),
                                    child: Text(
                                      'Olá \nFulano da Silva',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                        fontSize: screenWidth * 0.069,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.9,
                            ),
                          ),
                        ),
                        width: screenWidth * 0.9,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Instituição:',
                            labelStyle: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.04),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.025),
                              child: Text(
                                'Meus projetos',
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.47,
                                  top: screenHeight * 0.012),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.04,
                        bottom: screenHeight * 0.006),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AlterarSenhaPage(),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.025),
                              child: Text(
                                'Alterar senha',
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.48,
                                  top: screenHeight * 0.012),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.042,
                        bottom: screenHeight * 0.018),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.9,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AtualizarDadosPage(),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.025),
                              child: Text(
                                'Atualizar perfil',
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.45,
                                  top: screenHeight * 0.012),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.black,
                                size: screenWidth * 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          bool saiu = await sair();
                          if (saiu) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TelaInicialPage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Sair",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.048,
                            color: const Color(0xFFB6382B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.042),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/documentos.png',
                          width: screenWidth * 0.75,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.012),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "*Política de privacidade",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              color: const Color(0xFF572B11),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 Future<bool> sair() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
