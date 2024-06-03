import 'package:feteps/reservas/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstituicoesPage extends StatefulWidget {
  const InstituicoesPage({super.key});

  @override
  State<InstituicoesPage> createState() => _InstituicoesPageState();
}

class _InstituicoesPageState extends State<InstituicoesPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
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
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                SizedBox(
                  height: screenHeight * 0.12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Instituições',
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.09,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 14, 56, 70))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: screenHeight * 0.055,
                      left: screenWidth * 0.06,
                      right: screenWidth * 0.06),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquise uma Instituição...',
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
                    'Etecs',
                    style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.07,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 2.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 6; i++) CardWidget(inst: "etec")
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Colors.grey,
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Fatecs',
                    style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.07,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 6; i++) CardWidget(inst: "fatec")
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> sair() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    return true;
  }
}

class CardWidget extends StatelessWidget {
  final String inst;

  CardWidget({required this.inst});

  Color Cor(String inst) {
    if (inst == "etec") {
      return const Color.fromARGB(220, 69, 46, 172);
    } else if (inst == "fatec") {
      return const Color.fromARGB(220, 255, 209, 64);
    }
    return const Color.fromARGB(255, 255, 255, 255);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Cor(inst),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: screenWidth * 0.45,
          height: screenHeight * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Image.asset(
                'lib/assets/Rectangle.png',
                width: screenWidth * 0.42,
              ),
              const SizedBox(height: 5.0),
              const Text(
                'XXXXXXX',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 3.0),
              Text(
                'xxxxxxx',
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 158, 156, 156)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
