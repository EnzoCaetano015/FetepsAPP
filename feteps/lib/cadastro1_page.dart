import 'dart:convert';
import 'package:feteps/cadastroInstitu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'cadastro2_page.dart';
import 'telainicial_page.dart';

//AJUSTES NA RESPONSIVIDADE
class Cadastro1Page extends StatefulWidget {
  const Cadastro1Page({Key? key}) : super(key: key);

  @override
  _Cadastro1PageState createState() => _Cadastro1PageState();
}

class _Cadastro1PageState extends State<Cadastro1Page> {
  final _formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> items = [];
  String? selectedItem;

  List<Map<String, dynamic>> itemsInstituicao = [];
  String? selectedItemInstituicao;
  String? selectedUserType;
  String? selectedMainOption;
  String? selectedSubOption;
  List<String> userTypes = [];

  Map<String, List<Map<String, dynamic>>> options = {
    'Etec': [],
    'Fatec': [],
    'Outros': [],
  };
  bool isLoading = false;

  final Map<String, String> apiUrls = {
    'Etec':
        'https://profandersonvanin.com.br/appfeteps/pages/Institution/get.php?type=ETEC&limit=300',
    'Fatec':
        'https://profandersonvanin.com.br/appfeteps/pages/Institution/get.php?type=FATEC&limit=300',
    'Outros':
        'https://profandersonvanin.com.br/appfeteps/pages/Institution/get.php?type=OUTROS&limit=300',
  };

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse(
        'https://profandersonvanin.com.br/appfeteps/pages/TypesUser/get.php'));

    if (response.statusCode == 200) {
      final dynamic decodedData = json.decode(response.body);
      //print(decodedData);

      if (decodedData is List<dynamic>) {
        setState(() {
          items = decodedData.cast<Map<String, dynamic>>();
        });
      } else if (decodedData is Map<String, dynamic> &&
          decodedData.containsKey('response')) {
        setState(() {
          items = List<Map<String, dynamic>>.from(decodedData['response']);
        });
      } else {
        throw Exception(
            'A resposta da API não é uma lista ou um mapa com a chave "response"');
      }
    } else {
      throw Exception('Falha ao carregar itens da API');
    }
  }

  Future<void> fetchOptions(String type) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(apiUrls[type]!));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        //print('API response for $type: $data');

        if (data is Map && data['response'] is List) {
          List<Map<String, dynamic>> institutions =
              (data['response'] as List<dynamic>)
                  .map((e) => {'id': e['id'], 'name': e['name_institution']})
                  .toList();

          institutions.sort((a, b) {
            String cleanA = a['name']
                .toUpperCase()
                .replaceFirst(RegExp(r'^PROFESSOR(A)? '), '');
            String cleanB = b['name']
                .toUpperCase()
                .replaceFirst(RegExp(r'^PROFESSOR(A)? '), '');
            return cleanA.compareTo(cleanB);
          });

          setState(() {
            options[type] = institutions;
          });
        } else {
          throw Exception('Unexpected data format');
        }
      } else {
        throw Exception('Failed to load institutions');
      }
    } catch (e) {
      print('Error fetching options: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

//LAYOUT RESPONSIVO USANDO MEDIAQUERY
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
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
                            width: MediaQuery.of(context).size.width * 0.58,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CADASTRO",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.069,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.036,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: items.isEmpty
                                  ? const Padding(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: CircularProgressIndicator(
                                          color: Color(0xFFFFD35F)),
                                    )
                                  : DropdownButtonFormField(
                                      icon: Icon(
                                        Icons.person,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.072,
                                        color: Colors.black,
                                      ),
                                      value: selectedItem,
                                      items: items
                                          .map<DropdownMenuItem<String>>(
                                              (item) {
                                        return DropdownMenuItem<String>(
                                          value: item['id'].toString(),
                                          child: Text(item[
                                              'description']), // Mostrando apenas o campo 'description'
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedItem = value;
                                        });
                                        //print('Item selecionado: $value');
                                      },
                                      decoration: InputDecoration(
                                          labelText:
                                              'Selecione um tipo de usuário',
                                          labelStyle: TextStyle(
                                            color: const Color(0xFF0E414F),
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                          ),
                                          border: const OutlineInputBorder(),
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, selecione um tipo de usuário';
                                        }
                                        return null;
                                      },
                                    ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.036,
                            ),
                            DropdownButtonFormField<String>(
                              icon: Icon(
                                Icons.business,
                                size: MediaQuery.of(context).size.width * 0.072,
                                color: Colors.black,
                              ),
                              value: selectedMainOption,
                              items: options.keys.map<DropdownMenuItem<String>>(
                                (option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedMainOption = value;
                                  selectedSubOption = null;
                                });
                                if (value != null) {
                                  fetchOptions(value);
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Selecione um tipo de instituição',
                                  labelStyle: TextStyle(
                                    color: const Color(0xFF0E414F),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045,
                                  ),
                                  border: const OutlineInputBorder(),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, selecione um tipo de instituição';
                                }
                                return null;
                              },
                              isExpanded: true,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.036,
                            ),
                            if (selectedMainOption != null)
                              isLoading
                                  ? const Center(
                                      child: Padding(
                                      padding: EdgeInsets.only(bottom: 15.0),
                                      child: CircularProgressIndicator(
                                        color: Color(0xFFFFD35F),
                                      ),
                                    ))
                                  : SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14,
                                      child: DropdownButtonFormField<String>(
                                        icon: Icon(
                                          Icons.house,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.072,
                                          color: Colors.black,
                                        ),
                                        value: selectedSubOption,
                                        items:
                                            (options[selectedMainOption!] ?? [])
                                                .map<DropdownMenuItem<String>>(
                                          (subOption) {
                                            return DropdownMenuItem<String>(
                                              value: subOption['id'].toString(),
                                              child: Text(subOption['name']),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedSubOption = value;
                                          });

                                          //print('ID da instituição selecionada: $value');
                                        },
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Selecione sua instituição',
                                            labelStyle: TextStyle(
                                                color: Color(0xFF0E414F),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.5),
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Por favor, selecione uma instituição';
                                          }
                                          return null;
                                        },
                                        isExpanded: true,
                                      ),
                                    ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
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
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          final selectedUserTypeName =
                                              items.firstWhere((item) =>
                                                  item['id'].toString() ==
                                                  selectedItem)['description'];
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Cadastro2Page(
                                                //ENVIANDO O USUARIO E O ID PARA OUTRA PAGINA
                                                selectedItem:
                                                    //selectedUserTypeName,
                                                    //selectedMainOption,
                                                    selectedItem,
                                                selectedItemInstituicao:
                                                    selectedSubOption,
                                              ),
                                            ),
                                          );
                                        }
                                      },
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
                                        "Continuar",
                                        style: GoogleFonts.oswald(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.048,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CadastroInstituicao(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sua instituição não está na lista?',
                                      style: GoogleFonts.oswald(
                                        color: const Color(0xFFB6382B),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.044,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            )
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
      ),
    );
  }
}
