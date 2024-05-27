import 'dart:convert';

import 'package:feteps/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'e-mail',
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
                    labelText: 'senha',
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
                ElevatedButton(
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (_formKey.currentState!.validate()) {
                      bool deuCerto = await login();
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (deuCerto) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        _passwordController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  child: Text('ENTRAR'),
                ),
              ],
            ),
          ),
        ),
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
      print(jsonDecode(resposta.body)['token']);
      final url2 = Uri.parse(
          'https://profandersonvanin.com.br/appfeteps/pages/Users/authUser.php');

      final response = await http.get(url2);
      String meuToken = (json.decode(response.body)['token']);
      print(meuToken);
      await sharedPreferences.setString('token', 'meuToken');

      return true;
    } else {
      print(jsonDecode(resposta.body));
      print('Deu erro');
      return false;
    }
  }
}
