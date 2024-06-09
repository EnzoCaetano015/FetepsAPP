import 'package:feteps/avaliar_page.dart';
import 'package:feteps/instituicoes_page.dart';
import 'package:feteps/perfil_page.dart';
import 'package:feteps/projetos_page.dart';
import 'package:feteps/palestrantes_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:feteps/sobrenos_page.dart';
import 'package:feteps/telainicial_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFFF5F5F5),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 112,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                      ),
                      child: Builder(builder: (BuildContext context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).closeEndDrawer();
                          },
                          icon: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.arrow_back_sharp,
                                color: Color(0xFF0E414F),
                                size: 45,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    text: 'Home',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SobrePage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.person,
                    text: 'Perfil',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerfilPage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings,
                    text: 'Projetos',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjetosPage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.business,
                    text: 'Participantes',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InstituicoesPage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.place,
                    text: 'Mapa',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.mic_none,
                    text: 'Palestrantes',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PalestrantesPage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.lightbulb,
                    text: 'Curiosidade',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.group,
                    text: 'Patrocinadores',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.info,
                    text: 'Sobre',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SobreNosPage(),
                        ),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.thumb_up,
                    text: 'Avalições',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AvaliacaoPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFF5F5F5),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFFFD35F), Color(0xFF572B11)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.5, right: 4),
                  child: ElevatedButton(
                    onPressed: () async {
                      bool saiu = await sair();
                      if (saiu) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TelaInicialPage(),
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
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Colors.transparent, width: 0),
                      ),
                    ),
                    child: Text(
                      "Log-out",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black38, width: 1),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black, size: 35),
        title: Text(
          text,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
        trailing: IconButton(
          icon:
              const Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
          onPressed: () {},
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
