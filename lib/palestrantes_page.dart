import 'package:feteps/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:feteps/tela_palestrante.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class PalestrantesPage extends StatelessWidget {
  const PalestrantesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PalestrantesHomePage(),
      ),
    );
  }
}

class PalestrantesHomePage extends StatefulWidget {
  const PalestrantesHomePage({Key? key}) : super(key: key);

  @override
  PalestrantesHomeState createState() => PalestrantesHomeState();
}

class PalestrantesHomeState extends State<PalestrantesHomePage> {
  final Map<String, List<dynamic>> _palestrantesPorData = {};
  final Map<String, String> displayDates = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPalestrantes();
  }

  Future<void> _fetchPalestrantes() async {
    try {
      final response = await http.get(Uri.parse(
          'https://profandersonvanin.com.br//appfeteps/pages/Event/get.php'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['response'];
        _organizePalestrantesPorData(data);
        setState(() {
          _isLoading = false;
        });
      } else {
        throw Exception('Falha ao carregar os palestrantes');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  void _organizePalestrantesPorData(List<dynamic> palestrantes) {
    for (var palestrante in palestrantes) {
      final eventType = palestrante['type_event'];
      if (eventType != null && eventType['description'] == 'Palestra') {
        String data =
            palestrante['date_time'].substring(5, 10).replaceAll('-', '/');
        String fixedDate = _mapDate(palestrante['date_time']);

        if (_palestrantesPorData.containsKey(data)) {
          _palestrantesPorData[data]!.add(palestrante);
        } else {
          _palestrantesPorData[data] = [palestrante];
          displayDates[data] = fixedDate;
        }
      }
    }
  }

  String _mapDate(String date) {
    DateTime dataC = DateTime.parse(date);
    return "${dataC.day}/${dataC.month}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const SobrePage(),
                      type: PageTransitionType.topToBottom),
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
                    color: const Color(0xFF0E414F),
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
      endDrawer: const MenuPage(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFFFFD35F)))
          : ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Palestrantes',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.09,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 14, 56, 70),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildPalestranteSections(),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildPalestranteSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _palestrantesPorData.entries.map((entry) {
        String data = entry.key;
        String displayDate = displayDates[data]!;
        List<dynamic> palestrantes = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Text(
                displayDate,
                style: GoogleFonts.inter(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: const Color.fromARGB(255, 61, 20, 10),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Divider(
                color: Colors.grey,
                thickness: MediaQuery.of(context).size.width * 0.005,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: palestrantes.isNotEmpty
                    ? palestrantes.map((palestrante) {
                        return CardWidget(
                            palestrante: palestrante,
                            lista: palestrantes,
                            total: _palestrantesPorData);
                      }).toList()
                    : [
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Text(
                            'Ainda não há palestrantes para este dia.',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Map<String, dynamic> palestrante;
  final Map<String, List<dynamic>> total;
  final List<dynamic> lista;

  CardWidget(
      {required this.palestrante, required this.lista, required this.total});

  @override
  Widget build(BuildContext context) {
    final exhibitor = (palestrante["exhibitors"] as List).isNotEmpty
        ? palestrante["exhibitors"][0]
        : null;
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tela_palestrante(
                  lista: lista, palestrante: palestrante, totalP: total),
            ),
          );
        },
        child: Card(
          color: const Color(0xFFFFD35F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                if (exhibitor["photo"] != null && exhibitor["photo"].isNotEmpty)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.185,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    )),
                    child: Image.network(
                      exhibitor["photo"],
                      width: MediaQuery.of(context).size.width * 0.42,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'lib/assets/Rectangle.png',
                          width: MediaQuery.of(context).size.width * 0.42,
                        );
                      },
                    ),
                  )
                else
                  Image.asset(
                    'lib/assets/Rectangle.png',
                    width: MediaQuery.of(context).size.width * 0.42,
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                exhibitor != null
                    ? Text(
                        exhibitor["name_exhibitor"],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.036,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      )
                    : Container(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                Text(
                  palestrante["title"],
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
