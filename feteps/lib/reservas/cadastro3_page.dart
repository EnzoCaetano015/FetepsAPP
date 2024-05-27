import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feteps/reservas/cadastro2_page.dart';

class Cadastro3Page extends StatefulWidget {
  const Cadastro3Page({super.key});

  @override
  State<Cadastro3Page> createState() => _Cadastro3PageState();
}

class _Cadastro3PageState extends State<Cadastro3Page> {
  final _formKey = GlobalKey<FormState>();
  //precisa criar um controler para receber a instituição
  //final _instController = TextEditingController();
  final _cargoController = TextEditingController();
  final _areaController = TextEditingController();

  //Valores do Dropdown Button
  //Precisa verificar todos os dropdown para esses valores padrão
  String valorTipoUsuario = 'Estudante';
  String valorExpositor = "Sim";
  String valorTipoOutros = "Visitante";
  String valorInstituicao = 'Etec';
  String valorCargo = 'Estudante';

  //**************************************************** */
  //TESTE PARA OCULTAR/EXIBIR WIDGETS
  // Variável para rastrear a seleção atual do DropDownButton
  late String _itemTesteSelecionado = "Item 1";
  late String _itemTipoUsuarioSelecionado = "Outros";

  // Variável booleana para controlar a visibilidade da Column
  bool _colunaTipoOutrosVisivel = false;

  // Método para atualizar o estado quando um novo item for selecionado
  void _selecionadoTipoUsuario(String? newValue) {
    setState(() {
      _itemTipoUsuarioSelecionado = newValue!;
      // Define a visibilidade da Column com base na seleção
      _colunaTipoOutrosVisivel = _itemTipoUsuarioSelecionado == 'Outros';
    });
  }
  //TESTE PARA OCULTAR/EXIBIR WIDGETS
  //**************************************************** */

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
                            builder: (context) => const Cadastro2Page(),
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
                              //Dropdown tipo_usuario
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Quem é você?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    icon: const Icon(Icons.menu),
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                    value: _itemTipoUsuarioSelecionado,
                                    onChanged: _selecionadoTipoUsuario,
                                    items: <String>[
                                      'Estudante',
                                      'Professor',
                                      'Outros'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),

                              //Dropdown ExpositorSimNao?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Você é expositor?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    value: valorExpositor,
                                    icon: const Icon(Icons.menu),
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        valorExpositor = newValue!;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Sim',
                                        child: Text('Sim'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Não',
                                        child: Text('Não'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              //Dropdown tipo_outros?
                              //Esse só deve aparecer se Quem é você = Outros
                              _colunaTipoOutrosVisivel
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          'Você é?',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        DropdownButton<String>(
                                          isExpanded: true,
                                          value: valorTipoOutros,
                                          icon: const Icon(Icons.menu),
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              valorTipoOutros = newValue!;
                                            });
                                          },
                                          items: const [
                                            DropdownMenuItem<String>(
                                              value: 'Visitante',
                                              child: Text('Visitante'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Palestrante',
                                              child: Text('Palestrante'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Avaliador',
                                              child: Text('Avaliador'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Empresa',
                                              child: Text('Empresa'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Profissional',
                                              child: Text('Profissional'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container(),

                              //Dropdown tipo_instituicao
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'De qual instituição você faz parte?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    value: valorInstituicao,
                                    icon: const Icon(Icons.menu),
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        valorInstituicao = newValue!;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Etec',
                                        child: Text('Etec'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Fatec',
                                        child: Text('Fatec'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Outros',
                                        child: Text('Outros'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              //Mostra mostra_instituicao
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //Mostrar se for ETEC ou FATEC
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Escolha uma ETEC ou FATEC',
                                      hintText: 'Mostrar Lista ETEC/FATEC',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    controller: _areaController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  //Mostrar se for Parceiras
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Escolha uma Parceira',
                                      hintText: 'Mostrar Lista PARCEIROS',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: GoogleFonts.roboto(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    controller: _areaController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ],
                              ),

                              //SEPARADOR
                              const SizedBox(
                                height: 30,
                              ),

                              //Botão para levar cadastrar Instituição
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Minha Instituição não está nessa lista!',
                                  style: GoogleFonts.oswald(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),

                              //SEPARADOR
                              const SizedBox(
                                height: 30,
                              ),

                              //Nome da nova_instituicao - Texto Livre
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Qual o nome da sua instituição?',
                                  hintText: 'Texto livre para escrita',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _areaController,
                                keyboardType: TextInputType.text,
                              ),

                              //SEPARADOR
                              const SizedBox(
                                height: 30,
                              ),

                              //Area de atuacao - Texto Livre
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Qual sua área de atuação?',
                                  hintText: 'Texto livre para escrita',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: GoogleFonts.roboto(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: _areaController,
                                keyboardType: TextInputType.text,
                              ),

                              //SEPARADOR
                              const SizedBox(
                                height: 30,
                              ),

                              //BOTÃO CONFIRMA
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Finalizar Cadastro',
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

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        //_dropdownValue = selectedValue;
      });
    }
  }
}
