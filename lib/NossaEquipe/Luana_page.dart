import 'package:feteps/NossaEquipe_page.dart';
import 'package:feteps/appbar/appbar2_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class LuanaPage extends StatelessWidget {
  final String githubUrl = "https://github.com/Luana1c";
  final String linkedinUrl ="https://www.linkedin.com/in/luana-mathias-8890132b8/";
  final String email = "luana.gaarcia07@gmail.com";

  const LuanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar2_page(screenWidth: screenWidth, destinationPage: const NossaEquipePage()),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.03, bottom: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Participante do Projeto',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'lib/assets/equipe/luana.jpg',
                      height: screenHeight * 0.35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.03),
                  child: Container(
                    color: const Color(0xFFFFD35F),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Luana Garcia Mathias',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                  ),
                  child: Container(
                    color: const Color(0xFFD9D9D9),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Text(
                        'Modelagem Figma',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.048,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aluna da ETEC Prof Maria Cristina Medeiros',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.048,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home,
                            color: Colors.black, size: screenWidth * 0.1),
                        onPressed: () => _launchURL(githubUrl),
                      ),
                      IconButton(
                        icon: Icon(Icons.work,
                            color: Colors.blue, size: screenWidth * 0.1),
                        onPressed: () => _launchURL(linkedinUrl),
                      ),
                      IconButton(
                        icon: Icon(Icons.email,
                            color: Colors.orange, size: screenWidth * 0.1),
                        onPressed: () => _copyToClipboard(email, context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Email copiado para a área de transferência')),
    );
  }
}
