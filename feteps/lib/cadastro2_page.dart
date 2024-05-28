import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/telainicial_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cadastro2Page extends StatefulWidget {
  final String? selectedItem;
  final String? selectedItemInstituicao;

  const Cadastro2Page({
    Key? key,
    required this.selectedItem,
    required this.selectedItemInstituicao,
  }) : super(key: key);

  @override
  State<Cadastro2Page> createState() => _Cadastro2PageState();
}

class _Cadastro2PageState extends State<Cadastro2Page> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ufController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _areaatividadeController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  String valorExpositor = 'Não';

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ufController.dispose();
    _cidadeController.dispose();
    _areaatividadeController.dispose();
    _dataNascimentoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 30, 142, 174),
              onPrimary: Colors.black,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dataNascimentoController.text = _dateFormat.format(picked);
      });
    }
  }

  void enviarDados() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool valorBool = valorExpositor == 'Sim';
    String dataAtual = DateTime.now().toIso8601String().split('T')[0];

    int? idType = int.tryParse(widget.selectedItem ?? '');
    int? idInstitution = int.tryParse(widget.selectedItemInstituicao ?? '');

    if (idType == null || idInstitution == null) {
      print('Erro: idType e idInstitution devem ser valores numéricos válidos');
      return;
    }

    var url = Uri.parse(
        'https://profandersonvanin.com.br/appfeteps/pages/Users/createUser.php');
    var request = http.MultipartRequest('POST', url);

    request.fields['userName'] = _nomeController.text;
    request.fields['data de nascimento'] = _dataNascimentoController.text;
    request.fields['userEmail'] = _emailController.text;
    request.fields['city'] = _cidadeController.text;
    request.fields['state'] = _ufController.text;
    request.fields['userPassword'] = _passwordController.text;
    request.fields['exhibitor'] = valorBool.toString();
    request.fields['idType'] = idType.toString();
    request.fields['idInstitution'] = idInstitution.toString();
    request.fields['registerDate'] = dataAtual;
    request.fields['areaOfActivityCourse'] = _areaatividadeController.text;

    var response = await request.send();

    if (response.statusCode == 200) {
      final snackBar = const SnackBar(
        content: Text(
          'Dados cadastrados com sucesso',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaInicialPage(),
        ),
      );
    } else {
      print('Falha ao enviar dados: ${response.statusCode}');
    }
  }

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
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'lib/assets/fundo.png',
                          width: 190,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CADASTRO",
                      style: GoogleFonts.roboto(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dados pessoais',
                      style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //USUARIO E ID SELECIONADOS FUNCIONANDO
                                Text(
                                  'Tipo de Usuário: ${widget.selectedItem}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'ID da Instituição: ${widget.selectedItemInstituicao}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _nomeController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite seu nome';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Data de nascimento',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: Icon(Icons.calendar_today,
                                  color: Colors.black),
                            ),
                            controller: _dataNascimentoController,
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecione sua data de nascimento';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite seu e-mail';
                              } else if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                  .hasMatch(value)) {
                                return 'Por favor, digite um e-mail válido';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite sua senha';
                              } else if (value.length < 6) {
                                return 'A senha deve ter pelo menos 6 caracteres';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Estado (UF)',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _ufController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite seu estado';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Cidade',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _cidadeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite sua cidade';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Área de Atuação',
                              labelStyle: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            controller: _areaatividadeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite sua área de atuação';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: DropdownButtonFormField<String>(
                              value: valorExpositor,
                              onChanged: (String? newValue) {
                                setState(() {
                                  valorExpositor = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Expositor',
                                labelStyle: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              items: <String>[
                                'Não',
                                'Sim'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    gradient: const LinearGradient(
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
                                      onPressed: enviarDados,
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 39),
                                        backgroundColor: Colors.white,
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                      ),
                                      child: Text(
                                        "Cadastrar",
                                        style: GoogleFonts.oswald(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
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
}
