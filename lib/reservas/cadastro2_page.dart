import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/reservas/cadastro3_page.dart';
import 'package:feteps/reservas/cadastro_page.dart';

class Cadastro2Page extends StatefulWidget {
  const Cadastro2Page({super.key});

  @override
  State<Cadastro2Page> createState() => _Cadastro2PageState();
}

class _Cadastro2PageState extends State<Cadastro2Page> {
  final _formKey = GlobalKey<FormState>();
  final _nascController = TextEditingController();
  final _ufController = TextEditingController();
  final _cidadeController = TextEditingController();

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
                            builder: (context) => const CadastroPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.asset('lib/assets/logo.png'),
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
                    padding: const EdgeInsets.only(top: 35.0),
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
                              width: 190,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CADASTRO",
                          style: GoogleFonts.roboto(
                              fontSize: 25.0,
                              color: const Color(0xFF572B11),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Dados Pessoais",
                          style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              color: const Color(0xFF572B11),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Data de Nascimento',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _nascController,
                                keyboardType: TextInputType.datetime,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Estado',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _ufController,
                                keyboardType: TextInputType.text,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Cidade',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _cidadeController,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Cadastro3Page(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Próximo Passo',
                                  style: GoogleFonts.oswald(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
