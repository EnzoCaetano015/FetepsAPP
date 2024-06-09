import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DetalheProjectPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const DetalheProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
     final double screenHeight = MediaQuery.of(context).size.height;
      final String? bannerUrl = project['banner'];
    // Converte o 'id_ods' para string e fornece um valor padrão se for null
    String odsId =
        project['ods']['id_ods']?.toString() ?? 'ID ODS Não Disponível';
    String nameOds =
        project['ods']['name_ods']?.toString() ?? 'Nome ODS Não Disponível';
        

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0E414F),
        textTheme: GoogleFonts.interTextTheme(),
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
                      Navigator.pop(context);
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
          padding: const EdgeInsets.all(20.0),
          children: [
            Center(
              child: Text(
                // Exibe o ID ODS convertido para string
                'ODS $odsId: $nameOds',
                style: GoogleFonts.inter(
                  fontSize:  MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
             if (bannerUrl != null && bannerUrl.isNotEmpty)
                  Image.network(
                    bannerUrl,
                    width: screenWidth * 0.42,
                    height: screenHeight * 0.19,
                    
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'lib/assets/Rectangle.png',
                        width: screenWidth * 0.42,
                      );
                    },
                  )
                else
                  Image.asset(
                    'lib/assets/Rectangle.png',
                    width: screenWidth * 0.42,
                  ),
            const SizedBox(height: 20),
            Text(
              project['name_project'] ?? 'Nome do Projeto',
              style: GoogleFonts.inter(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 14, 56, 70),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Resumo',
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 208, 20, 20),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              project['project_abstract'] ?? 'Lorem ipsum dolor sit amet...',
              style: GoogleFonts.inter(
                fontSize: 15.0,
                color: const Color.fromARGB(255, 14, 56, 70),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 40,
              thickness: 2,
            ),
            Text(
              "Integrantes",
              style: GoogleFonts.inter(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 14, 56, 70),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.spaceAround,
              children: [
                // Itera sobre os expositores e cria um IconPerson para cada um
                for (var exhibitor in project['exhibitors'])
                  IconPerson(exhibitor: exhibitor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconPerson extends StatelessWidget {
  final Map<String, dynamic> exhibitor;

  const IconPerson({super.key, required this.exhibitor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Exibe a foto do expositor, ou um ícone padrão se não houver foto
        exhibitor['photo'] != null && exhibitor['photo'].isNotEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(exhibitor['photo']),
                radius: 25,
              )
            : const FaIcon(
                FontAwesomeIcons.userCircle,
                size: 50.0,
                color: Color.fromARGB(255, 14, 56, 70),
              ),
        const SizedBox(height: 8),
        Text(
          exhibitor['name_exhibitor'] ?? 'Nome Desconhecido',
          style: GoogleFonts.inter(
            fontSize: 14.4,
            color: const Color.fromARGB(255, 14, 56, 70),
          ),
        ),
      ],
    );
  }
}
