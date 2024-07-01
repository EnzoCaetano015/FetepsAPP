import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Menu_Page.dart';
import 'altsenha_page.dart';
import 'atualizaperfil_page.dart';
import 'sobre_page.dart';
import 'telainicial_page.dart';
import 'global.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  Map<String, dynamic>? userData;
  bool isLoading = false;
  String idUsuario = '';
  String nomeUsuario = '';
  String tokenLogado = '';
  String institutionName = 'No Institution';
  String institutionType = 'No Type';
  final TextEditingController _institutionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idUsuario = prefs.getString('idUsuario') ?? '';
      nomeUsuario = prefs.getString('nomeUsuario') ?? 'No Username';
      tokenLogado = prefs.getString('token') ?? '';
    });

    // Print the values of SharedPreferences to the console for debugging
    print('ID Usuario from SharedPreferences: $idUsuario');
    print('Nome Usuario from SharedPreferences: $nomeUsuario');
    print('Token from SharedPreferences: $tokenLogado');

    if (idUsuario.isNotEmpty) {
      await fetchUserData(int.tryParse(idUsuario) ?? 0);
    }
  }

  Future<void> fetchUserData(int id) async {
    setState(() {
      isLoading = true;
    });

    String url =
        GlobalPageState.Url + '/appfeteps/pages/Users/getUserById.php?id=$id';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $tokenLogado',
        },
      );

      // Debugging information
      print('Request URL: $url');
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userData = data;
          institutionName =
              data['institution']?['name_institution'] ?? 'No Institution';
          institutionType = data['institution']?['classification'] ?? 'No Type';
          _institutionController.text =
              institutionName; // Set the institution name in the controller
        });

        // Print the fetched user data to the console for debugging
        print('User Data: $data');
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child:  const SobrePage(),
                      type: PageTransitionType.topToBottom
                    ),
                  );
                },
                icon: Icon(
                  size: screenWidth * 0.075,
                  Icons.arrow_back_sharp,
                  color: const Color(0xFF0E414F),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Image.asset(
                  'lib/assets/logo.png',
                  width: screenWidth * 0.6,
                ),
              )
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: screenWidth * 0.095,
                  color: const Color(0xFF0E414F),
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        endDrawer: const MenuPage(),
        body: ListView(
          children: [
            Column(
              children: [
                _buildHeader(screenHeight, screenWidth),
                _buildUserInfo(screenHeight, screenWidth),
                _buildInstitutionField(screenWidth, screenHeight),
                _buildActionItems(screenHeight, screenWidth),
                _buildLogoutButton(screenWidth, screenHeight),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.048,
                      vertical: screenHeight * 0.01),
                  child: const Divider(
                    color: Colors.black54,
                  ),
                ),
                _buildDocumentsImage(screenWidth, screenHeight),
                _buildPrivacyPolicyLink(screenWidth),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.115,
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'PERFIL',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.069,
                color: const Color(0xFF0E414F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(double screenHeight, double screenWidth) {
    double fontSize = screenWidth * 0.065;
    if (nomeUsuario.length > 15) {
      int excessLength = nomeUsuario.length - 15;
      double reductionFactor = 0.005 * excessLength;
      fontSize = fontSize - (fontSize * reductionFactor);
    }

    return SizedBox(
      height: screenHeight * 0.18,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.06),
            child: Image.asset(
              'lib/assets/user2.png',
              width: screenWidth * 0.3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.025),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Olá\n',
                        style: GoogleFonts.poppins(
                          fontSize: fontSize,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: nomeUsuario,
                        style: GoogleFonts.poppins(
                          fontSize: fontSize,
                          color: const Color(0xFFD4A03D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInstitutionField(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.06, bottom: screenHeight * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.9,
                ),
              ),
            ),
            width: screenWidth * 0.89,
            child: TextFormField(
              readOnly: true,
              controller: _institutionController,
              decoration: InputDecoration(
                labelText: institutionType,
                labelStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItems(double screenHeight, double screenWidth) {
    return Column(
      children: [
        _buildActionItem(
          screenHeight,
          screenWidth,
          label: 'Alterar senha',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AlterarSenhaPage(idUsuario: idUsuario),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.048),
          child: const Divider(
            color: Colors.black54,
          ),
        ),
        _buildActionItem(
          screenHeight,
          screenWidth,
          label: 'Atualizar perfil',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AtualizarDadosPage(),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.048),
          child: const Divider(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem(
    double screenHeight,
    double screenWidth, {
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.07,
          top: screenHeight * 0.022,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.065),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: screenWidth * 0.053,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.07,
        top: screenHeight * 0.02,
      ),
      child: GestureDetector(
        onTap: _logout,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Sair',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.065),
              child: Icon(
                Icons.logout,
                color: Colors.black,
                size: screenWidth * 0.055,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentsImage(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.02),
      child: Image.asset(
        'lib/assets/documentos.png',
        width: screenWidth * 0.5,
      ),
    );
  }

  Widget _buildPrivacyPolicyLink(double screenWidth) {
    return GestureDetector(
      onTap: () {
        showPrivacyPolicy();
      },
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth * 0.08),
        child: Text(
          'Política de Privacidade',
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.041,
            color: const Color(0xFF0E414F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Política de Privacidade"),
          content: const SingleChildScrollView(
            child: Text(
              "Conteúdo da política de privacidade...",
              textAlign: TextAlign.justify,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Fechar",
                style: TextStyle(
                  color: Color(0xFF0E414F),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TelaInicialPage()),
      (route) => false,
    );
  }
}
