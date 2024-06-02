import 'package:feteps/reservas/menu.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: 400,
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 30),
                    child: Image.asset(
                      'lib/assets/logo.png',
                      width: MediaQuery.of(context).size.width * 0.65,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Padding(
                      padding: EdgeInsets.only(
                        top: 9.5,
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
          endDrawer: CustomDrawer(),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Instituições',
                                  style: GoogleFonts.poppins(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.09,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 14, 56, 70))),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextField(
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
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.085,
                              color: const Color.fromARGB(255, 61, 20, 10),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      const SizedBox(height: 10.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 6; i++) CardWidget(inst: "etec")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Fatecs',
                          style: GoogleFonts.inter(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.085,
                              color: const Color.fromARGB(255, 61, 20, 10),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      const SizedBox(height: 10.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 6; i++)
                              CardWidget(inst: "fatec")
                          ],
                        ),
                      ),
                    ]),
              ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Cor(inst),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: 185.0,
          height: 240.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              Image.asset('lib/assets/Rectangle.png'),
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
