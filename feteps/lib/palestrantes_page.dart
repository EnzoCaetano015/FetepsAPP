import 'package:feteps/reservas/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PalestrantesPage extends StatelessWidget {
  const PalestrantesPage({super.key});

  @override
  Widget build(BuildContext context) {
     final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Palestrantes',
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 14, 56, 70),
                        ),
                      )
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
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '19/06',
                        style: GoogleFonts.inter(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          color: const Color.fromARGB(255, 61, 20, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    children: [for (int i = 1; i < 18; i++) CardWidget()],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '20/06',
                        style: GoogleFonts.inter(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          color: const Color.fromARGB(255, 61, 20, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    children: [for (int i = 1; i < 18; i++) CardWidget()],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '21/06',
                        style: GoogleFonts.inter(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          color: const Color.fromARGB(255, 61, 20, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    children: [for (int i = 1; i < 18; i++) CardWidget()],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '22/06',
                        style: GoogleFonts.inter(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          color: const Color.fromARGB(255, 61, 20, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                    children: [for (int i = 1; i < 18; i++) CardWidget()],
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

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Card(
        color: const Color.fromARGB(255, 179, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Image.asset(
                'lib/assets/Rectangle.png',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.15,
                fit: BoxFit.cover,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Text(
                'Nome do palestrante',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.036,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.003),
              Text(
                'Descrição',
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
