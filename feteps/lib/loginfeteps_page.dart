import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/home_page.dart';
import 'package:feteps/telainicial_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


//APENAS MECHI NO LAYOUT
class LoginFetepsPage extends StatefulWidget {
  const LoginFetepsPage({super.key});

  @override
  State<LoginFetepsPage> createState() => _LoginFetepsPageState();
}

class _LoginFetepsPageState extends State<LoginFetepsPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Color(0xFF0E414F),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 22, right: 22),
                child: Image.asset(
                  'lib/assets/logo.png',
                  width: 235,
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
                padding: const EdgeInsets.only(top: 45.0),
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
                          width: 220,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: GoogleFonts.roboto(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              //Text formfield EMAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              inputDecorationTheme: InputDecorationTheme(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelStyle: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
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
                          ),

                          //Text formfiel SENHA
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Theme(
                            data: Theme.of(context).copyWith(
                              inputDecorationTheme: InputDecorationTheme(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelStyle: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                labelStyle: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
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
                          ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFFD35F),
                                        Color(0xFF572B11)
                                      ],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3.5, right: 4),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);
                                        if (_formKey.currentState!.validate()) {
                                          bool deuCerto = await login();
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          if (deuCerto) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage(),
                                              ),
                                            );
                                          } else {
                                            _passwordController.clear();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        }
                                      },
                                      child: Text(
                                        "Confirmar",
                                        style: GoogleFonts.oswald(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(100, 39),
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
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
    );
  }

  final snackBar = SnackBar(
    content: Text(
      'e-mail ou senha são inválidos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final url = Uri.parse(
        'https://profandersonvanin.com.br/appfeteps/pages/Users/loginUser.php?userEmail=${_emailController.text}&userPassword=${_passwordController.text}');

    // Aqui usei a interpolação direto na url pois na api, o nome de usuário e senha
    // são passados como parâmetros e não no corpo como um Json

    // crio um corpo vazio pois é um argumento obrigatório no post
    final corpo = jsonEncode(<String, String>{});
    final resposta = await http.post(
      url,
      body: corpo,
    );

    if (resposta.statusCode == 200) {
      //print(jsonDecode(resposta.body)['accessToken']);
      final url2 = Uri.parse(
          'https://profandersonvanin.com.br/appfeteps/pages/Users/authUser.php');

      final response = await http.get(url2);
      String meuToken = (json.decode(response.body)['token']);
      //print(meuToken);
      await sharedPreferences.setString('token', 'meuToken');

      return true;
    } else {
      //print(jsonDecode(resposta.body));
      //print('Deu erro');
      return false;
    }
  }
}
