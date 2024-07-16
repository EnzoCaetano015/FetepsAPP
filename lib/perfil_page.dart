import 'dart:convert';
import 'package:feteps/MeusDados_page.dart';
import 'package:feteps/appbar/appbar1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Menu_Page.dart';
import 'altsenha_page.dart';
import 'atualizaperfil_page.dart';
import 'sobre_page.dart';
import 'telainicial_page.dart';
import 'global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:feteps/Modos/theme_provider.dart';

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
  String email = '';
  String estado = '';
  String cidade = '';
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
      email = prefs.getString('email') ?? '';
      estado = prefs.getString('state') ?? '';
      cidade = prefs.getString('city') ?? '';
    });

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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userData = data;
          institutionName =
              data['institution']?['name_institution'] ?? 'No Institution';
          institutionType = data['institution']?['classification'] ?? 'No Type';
          _institutionController.text = institutionName;
        });
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:
          AppBar1_page(screenWidth: screenWidth, destinationPage: SobrePage()),
      endDrawer: MenuPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(screenHeight, screenWidth, context),
            _buildUserInfo(screenHeight, screenWidth, context),
            _buildInstitutionField(screenWidth, screenHeight, context),
            _buildActionItems(screenHeight, screenWidth, context),
            _buildLogoutButton(screenWidth, screenHeight, context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.048,
                vertical: screenHeight * 0.01,
              ),
              child: Divider(
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
            ),
            _buildDocumentsImage(screenWidth, screenHeight),
            _buildPrivacyPolicyLink(screenWidth, screenHeight, context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      double screenHeight, double screenWidth, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Text(
              'Perfil',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.08,
                color: themeProvider.getSpecialColor3(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(
      double screenHeight, double screenWidth, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
            child: SvgPicture.network(
              'https://api.dicebear.com/9.x/bottts/svg?seed=$nomeUsuario',
              height: screenWidth * 0.3,
              width: screenWidth * 0.3,
              placeholderBuilder: (context) => CircularProgressIndicator(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.035),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Olá\n',
                        style: GoogleFonts.poppins(
                            fontSize: fontSize,
                            color: themeProvider.getSpecialColor3()),
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

  Widget _buildInstitutionField(
      double screenWidth, double screenHeight, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.06,
        bottom: screenHeight * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: themeProvider.getSpecialColor(),
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
                  color: themeProvider.getSpecialColor3(),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeProvider.getSpecialColor3(),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFFD4A03D),
                    width: screenWidth * 0.005,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItems(
      double screenHeight, double screenWidth, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        _buildActionItem(
          screenHeight,
          screenWidth,
          label: 'Meus Dados',
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child:  MeusDadosPage(),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          context: context,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.048),
          child: Divider(
            color: themeProvider.getSpecialColor3(),
          ),
        ),
        _buildActionItem(
          screenHeight,
          screenWidth,
          label: 'Alterar senha',
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: AlterarSenhaPage(idUsuario: idUsuario),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          context: context,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.048),
          child: Divider(
            color: themeProvider.getSpecialColor3(),
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
    required BuildContext context,
  }) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
                color: themeProvider.getSpecialColor3(),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.065),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: themeProvider.getSpecialColor3(),
                size: screenWidth * 0.053,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(
      double screenWidth, double screenHeight, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.07,
        top: screenHeight * 0.015,
      ),
      child: GestureDetector(
        onTap: () => _logout(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Sair',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.045,
                color: themeProvider.getSpecialColor3(),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.065),
              child: Icon(
                Icons.logout,
                color: themeProvider.getSpecialColor3(),
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

  Widget _buildPrivacyPolicyLink(
      double screenWidth, double screenHeight, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        showPrivacyPolicy(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: Text(
          'Política de Privacidade',
          style: GoogleFonts.poppins(
            decoration: TextDecoration.underline,
            decorationColor: themeProvider.getSpecialColor(),
            fontSize: screenWidth * 0.041,
            color: themeProvider.getSpecialColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void showPrivacyPolicy(BuildContext context) {
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

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => TelaInicialPage()),
      (route) => false,
    );
  }
}
