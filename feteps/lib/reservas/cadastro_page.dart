import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/telainicial_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                            builder: (context) => const TelaInicialPage(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CADASTRO",
                          style: GoogleFonts.roboto(
                              fontSize: 25.0,
                              color: const Color(0xFF572B11),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
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
                                  labelText: 'Nome',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _nomeController,
                                keyboardType: TextInputType.text,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) {
                                  if (email == null || email.isEmpty) {
                                    return 'Por favor digite seu e-mail';
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(_emailController.text)) {
                                    return 'Por favor, digite um e-mail correto';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                validator: (senha) {
                                  if (senha == null || senha.isEmpty) {
                                    return 'Por favor, digite a sua senha';
                                  } else if (senha.length < 3) {
                                    return 'Por favor, digite uma senha maior de 3 caracteres';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Confirmar Senha',
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {},
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
