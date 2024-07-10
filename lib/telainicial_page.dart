import 'package:feteps/cadastro1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/loginfeteps_page.dart';
import 'package:provider/provider.dart';
import 'package:feteps/Modos/theme_provider.dart';

//AJUSTES NA RESPONSIVIDADE
class TelaInicialPage extends StatefulWidget {
  const TelaInicialPage({super.key});

  @override
  State<TelaInicialPage> createState() => _TelaInicialPageState();
}

class _TelaInicialPageState extends State<TelaInicialPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    String logoAsset = themeProvider.getLogoAsset();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: SizedBox(
              width: 400,
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Image.asset(
                      logoAsset,
                      width: MediaQuery.of(context).size.width * 0.65,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.44,
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
                              width: MediaQuery.of(context).size.width * 0.65,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "BEM VINDO!",
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width * 0.069,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bem vindo ao aplicativo da \n Feira Tecnologica do \n Centro Paula Souza!",
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width * 0.052,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color(0xFFB6382B),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.012,
                              right: MediaQuery.of(context).size.width * 0.012),
                          child: ElevatedButton(
                            onPressed: () {
                              //Ir para a tela de login
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: const LoginFetepsPage(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 39),
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side:
                                    const BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: GoogleFonts.oswald(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const Cadastro1Page(),
                                  type: PageTransitionType.rightToLeftWithFade),
                            );
                          },
                          child: Text(
                            "Criar uma conta",
                            style: GoogleFonts.oswald(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          themeProvider.toggleTheme();
                        },
                        child: Text(
                          themeProvider.themeMode == ThemeMode.light
                              ? "Modo Escuro"
                              : "Modo Claro",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
