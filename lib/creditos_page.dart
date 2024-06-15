import 'package:feteps/Menu_Page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditosPage extends StatefulWidget {
  const CreditosPage({super.key});

  @override
  _CreditosPageState createState() => _CreditosPageState();
}

class _CreditosPageState extends State<CreditosPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
          seconds:
              400), // Reduzindo a duração da animação para aumentar a velocidade
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: -1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ))
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(); // Faz a animação repetir indefinidamente
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  icon: Icon(
                    size: MediaQuery.of(context).size.width * 0.075,
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.15,
                    ),
                    child: Text(
                      'Créditos',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: Offset(0, _animation.value * screenHeight * 2),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: Text(
                          'Clube das Winx (Winx Club)\nSei que você vai querer ser uma de nós!\nWinx Quando damos\nnossas mãos\nNos tornamos poderosas\nPorque juntas somos invencíveis\nWinx É tão bom poder sorrir\nE o mundo\niluminarVenha se juntar à nós voando\nSei que você vai querer ser uma de nós!\nCom o nosso raio o céu incendeia\nDando início a\numa aventura estelar\nE numa nuvem a mente vagueia\nColore a minha vida,\ncom tudo o que imagino Vou voar bem alto\n Winx Quando damos\nnossas mãos Nos tornamos poderosas\nPorque juntas somos invencíveis\nWinx Novidade igual não há\n Companheiras pra valer\n Venha se juntar à nós voando\n',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
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


