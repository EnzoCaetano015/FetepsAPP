import 'package:feteps/cadastro1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroInstituicaoPage extends StatelessWidget {
  const CadastroInstituicaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

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
                          builder: (context) => const Cadastro1Page(),
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
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFB6382B),
                            width: screenWidth * 0.01,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'lib/assets/fundo.png',
                            width: screenWidth * 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cadastre uma',
                        style: GoogleFonts.roboto(
                          fontSize: screenWidth * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'INSTITUIÇÃO',
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.07,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                _buildTextField(screenWidth, screenHeight, 'Nome:'),
                _buildTextField(screenWidth, screenHeight, 'Estado:'),
                _buildTextField(screenWidth, screenHeight, 'Cidade:'),
                _buildTextField(screenWidth, screenHeight, 'Pais:'),
                _buildTextField(screenWidth, screenHeight, 'Campus:'),
                _buildTextField(screenWidth, screenHeight, 'Email:'),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Código da Instituição:',
                            labelStyle: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.04,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFD35F), Color(0xFF572B11)],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.01,
                            right: screenWidth * 0.01,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Cadastro1Page(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                screenWidth * 0.25,
                                screenHeight * 0.05,
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                              ),
                            ),
                            child: Text(
                              "Cadastrar",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045,
                              ),
                            ),
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
    );
  }

  Padding _buildTextField(
      double screenWidth, double screenHeight, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.8,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: GoogleFonts.roboto(
                  color: Colors.black,
                     fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
