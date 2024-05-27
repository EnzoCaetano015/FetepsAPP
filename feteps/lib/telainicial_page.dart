import 'package:feteps/cadastro1_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/reservas/cadastro_page.dart';
import 'package:feteps/loginfeteps_page.dart';

//APENAS MECHI NO LAYOUT
class TelaInicialPage extends StatefulWidget {
  const TelaInicialPage({super.key});

  @override
  State<TelaInicialPage> createState() => _TelaInicialPageState();
}

class _TelaInicialPageState extends State<TelaInicialPage> {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.asset(
                      'lib/assets/logo.png',
                      width: 260,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFB6382B),
                            width: 3.5,
                          )),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/fundo.png',
                          width: 230,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 15.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BEM VINDO!",
                      style: GoogleFonts.roboto(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 55.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem vindo ao aplicativo da Feira \n Tecnologica do Centro Paula \nSouza!",
                      style: GoogleFonts.roboto(
                        fontSize: 18.5,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 11.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFD35F), Color(0xFF572B11)],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.5, right: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              //Ir para a tela de login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginFetepsPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 39),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(
                                    color: Colors.transparent, width: 0),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: GoogleFonts.oswald(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Cadastro1Page(),
                          ),
                        );
                      },
                      child: Text(
                        "Criar uma conta",
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
