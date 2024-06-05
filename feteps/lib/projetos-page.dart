import 'package:feteps/reservas/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Projetos extends StatelessWidget {
  const Projetos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProjetosHomePage(),
      ),
    );
  }
}

class ProjetosHomePage extends StatefulWidget {
  const ProjetosHomePage({super.key});

  @override
  ProjetosHomeState createState() => ProjetosHomeState();
}

class ProjetosHomeState extends State<ProjetosHomePage> {
  int _selectedButtonIndex = -1;
  int _selectedOds = 1;
  List<dynamic> _projects = [];

  void _updateSelectedOds(int ods) {
    setState(() {
      _selectedOds = ods;
      _fetchProjects(ods);
    });
  }

  //PUXANDO DA API
  Future<void> _fetchProjects(int ods) async {
    final response = await http.get(Uri.parse(
        'https://profandersonvanin.com.br/appfeteps/pages/Project/get.php?id_ods=$ods')); //DEFINI ODS COMO INTEIRO E CONCATENE PARA REPRESENTAR OS IDS

    if (response.statusCode == 200) {
      setState(() {
        _projects = json.decode(response.body)['response'];
      });
    } else {
      throw Exception('Failed to load projects');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SobrePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                color: Color(0xFF0E414F),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Image.asset(
                'lib/assets/logo.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: Icon(
                    Icons.menu,
                    size: MediaQuery.of(context).size.width * 0.095,
                    color: Color(0xFF0E414F),
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: MenuPage(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Projetos',
                    style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.09,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 14, 56, 70))),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: screenHeight * 0.055,
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquise um projeto...',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3.0,
                        color: Color.fromARGB(255, 255, 209, 64),
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search,
                        color: Color.fromARGB(255, 255, 209, 64)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Selecione uma ODS:',
                  style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.069,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 2.0),
              const SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 1; i < 18; i++)
                      GestureDetector(
                        onTap: () => _updateSelectedOds(i),
                        child:
                            CardWidget(ods: i, isSelected: _selectedOds == i),
                      )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "ODS ${CardWidget.texto(_selectedOds)[0]} - ${CardWidget.texto(_selectedOds)[1]}",
                  style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.058,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _updateSelectedButton(0);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenWidth * 0.0),
                      decoration: _selectedButtonIndex == 0
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(220, 255, 209, 64),
                                      width: 3.0)),
                            )
                          : null,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _updateSelectedButton(1);
                    },
                    child: Container(
                      decoration: _selectedButtonIndex == 1
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(220, 255, 209, 64),
                                      width: 3.0)),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < _projects.length; i++)
                      CardWidget2(
                        project: _projects[i],
                        ods: _selectedOds,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateSelectedButton(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }
}

class CardWidget extends StatelessWidget {
  final int ods;
  final bool isSelected;

  CardWidget({required this.ods, required this.isSelected});

  static Color cor(int ods) {
    switch (ods) {
      case 1:
        return const Color.fromARGB(255, 179, 0, 0);
      case 2:
        return const Color.fromARGB(255, 201, 177, 0);
      case 3:
        return const Color.fromARGB(255, 60, 131, 66);
      case 4:
        return const Color.fromARGB(255, 127, 13, 13);
      case 5:
        return const Color.fromARGB(255, 201, 59, 7);
      case 6:
        return const Color.fromARGB(255, 22, 149, 199);
      case 7:
        return const Color.fromARGB(255, 255, 234, 71);
      case 8:
        return const Color.fromARGB(255, 88, 3, 27);
      case 9:
        return const Color.fromARGB(255, 225, 107, 16);
      case 10:
        return const Color.fromARGB(255, 222, 79, 48);
      case 11:
        return const Color.fromARGB(255, 241, 150, 1);
      case 12:
        return const Color.fromARGB(255, 229, 194, 1);
      case 13:
        return const Color.fromARGB(255, 51, 128, 56);
      case 14:
        return const Color.fromARGB(255, 36, 119, 198);
      case 15:
        return const Color.fromARGB(255, 94, 147, 48);
      case 16:
        return const Color.fromARGB(255, 14, 101, 184);
      case 17:
        return const Color.fromARGB(255, 22, 71, 141);
      default:
        return const Color.fromARGB(255, 0, 0, 0);
    }
  }

  static List<String> texto(int ods) {
    switch (ods) {
      case 1:
        return ['1', 'Erradicação da pobreza'];
      case 2:
        return ['2', 'Fome zero e agricultura sustentável'];
      case 3:
        return ['3', 'Saúde e bem-estar'];
      case 4:
        return ['4', 'Educação de qualidade'];
      case 5:
        return ['5', 'Igualdade de gênero'];
      case 6:
        return ['6', 'Água potável e saneamento'];
      case 7:
        return ['7', 'Energia acessível e limpa'];
      case 8:
        return ['8', 'Trabalho decente e crescimento econômico'];
      case 9:
        return ['9', 'Indústria, inovação e infraestrutura'];
      case 10:
        return ['10', 'Redução das desigualdades'];
      case 11:
        return ['11', 'Cidades e comunidades sustentáveis'];
      case 12:
        return ['12', 'Consumo e produção responsáveis'];
      case 13:
        return ['13', 'Ação contra a mudança global do clima'];
      case 14:
        return ['14', 'Vida na água'];
      case 15:
        return ['15', 'Vida terrestre'];
      case 16:
        return ['16', 'Paz, justiça e instituições eficazes'];
      case 17:
        return ['17', 'Parcerias e meios de implementação'];
      default:
        return ['?', 'Meta desconhecida'];
    }
  }

  @override
  Widget build(BuildContext context) {
    const Alignment _startAlignment = Alignment.topLeft;
    const Alignment _endAlignment = Alignment.centerLeft;

    final intermediateAlignment = Alignment.lerp(
      _startAlignment,
      _endAlignment,
      0.5,
    ) as AlignmentGeometry;

    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: screenWidth * 0.48,
        width: screenWidth * 0.65,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        isSelected ? cor(ods).withOpacity(0.3) : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: cor(ods),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "ODS ${texto(ods)[0]}",
                      style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.025,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: intermediateAlignment,
                  child: Text(
                    texto(ods)[1],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.042,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenWidth * 0.20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: SizedBox(
                    child: Container(
                      color: cor(ods),
                      width: double.infinity,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "XX Projetos",
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget2 extends StatelessWidget {
  final Map<String, dynamic> project;
  final int ods;

  CardWidget2({required this.project, required this.ods});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: CardWidget.cor(ods),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: screenWidth * 0.45,
          height: screenWidth * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Image.asset(
                'lib/assets/Rectangle.png',
                width: screenWidth * 0.42,
              ),
              const SizedBox(height: 5.0),
              Text(
                project['name_project'], //PUXANDO O NOME DA API
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.042,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 3.0),
              Text(
                'name_institution', //NÃO CONSEGUI PUXAR O NOME DA INSITUIÇÃO
                style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
