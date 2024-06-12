import 'package:feteps/perfil_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AlterarSenhaPage extends StatelessWidget {
  const AlterarSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                            builder: (context) => PerfilPage(),
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
          body: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.03,
                        left: screenWidth * 0.08,
                        bottom: screenHeight * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Alterar Senha',
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.06,
                                color: const Color(0xFF0E414F),
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Digite a senha atual:',
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Digite a nova senha:',
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.075),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirmar nova senha:',
                                labelStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: const Color(0xFFB6382B),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.012,
                                right:
                                    MediaQuery.of(context).size.width * 0.012),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 39),
                                backgroundColor: Colors.white,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              child: Text(
                                "Atualizar Senha",
                                style: GoogleFonts.oswald(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.025),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/senha.png',
                            width: screenWidth * 0.75,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
