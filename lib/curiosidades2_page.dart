import 'package:feteps/Menu_Page.dart';
import 'package:feteps/curiosidades_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class Curiosidade2Page extends StatelessWidget {
  const Curiosidade2Page({super.key});

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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const CuriosidadePage(),
                                type: PageTransitionType.bottomToTop),
                          );
                        },
                        icon: Icon(
                          size: MediaQuery.of(context).size.width * 0.075,
                          Icons.arrow_back_sharp,
                          color: const Color(0xFF0E414F),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 20, right: 20),
                      child: Image.asset(
                        'lib/assets/logo.png',
                        width: MediaQuery.of(context).size.width * 0.65,
                      ),
                    )
                  ],
                ),
              ),
              body: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.all(screenWidth * 0.025),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Vamos conhecer cada ODS?',
                                style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.055,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 14, 56, 70)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFD32F2F),
                            collapsedBackgroundColor: const Color(0xFFD32F2F),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 1',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 1. Acabar com\na pobreza em todas as\nsuas formas, em todos\nos lugares',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nAté 2030, reduzir pelo\nmenos à metade a\nproporção de homens,\nmulheres e crianças, de\ntodas as idades, que vivem\nna pobreza, em todas as\nsuas dimensões, de\nacordo com as definições\nnacionais.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFDDA73A),
                            collapsedBackgroundColor: const Color(0xFFDDA73A),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 2',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 2. Acabar com\na fome, alcançar a\nsegurança alimentar e\nmelhoria da nutrição e\npromover a agricultura\nsustentável',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nAté 2030, acabar com a\nfome e garantir o acesso\nde todas as pessoas,\nem particular pessoas em\nsituações vulneráveis,\nincluindo crianças, a\nalimentos seguros,\nnutritivos e suficientes\ndurante todo o ano.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF4CA146),
                            collapsedBackgroundColor: const Color(0xFF4CA146),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 3',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 3. Assegurar\numa vida saudável e\npromover o bem-estar\npara todas e todos, em\ntodas as idades',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nAté 2030, acabar com as\nepidemias de AIDS,\ntuberculose, malária e\ndoenças tropicais\nnegligenciadas, e combater\na hepatite, doenças\ntransmitidas pela água, e\noutras doenças transmissíveis\ne reduzir em\num terço a mortalidade\nprematura por doenças não\ntransmissíveis via prevenção\ne tratamento, e promover a\nsaúde mental e o bem-estar',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFC7212F),
                            collapsedBackgroundColor: const Color(0xFFC7212F),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 4',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 4. Assegurar a\neducação inclusiva e\nequitativa e de\nqualidade, e promover\noportunidades de\naprendizagem ao longo\nda vida para todas e\ntodos',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nAté 2030, garantir que todas\nas meninas e meninos\ncompletem o ensino primário\ne secundário livre, equitativo\ne de qualidade, que conduza\na resultados de\naprendizagem relevantes e\neficazes.\nAssegurar a igualdade de\nacesso para todos os\n homens e mulheres à\neducação técnica,\nprofissional e superior de\nqualidade, a preços\n acessíveis, incluindo\nuniversidade.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFEF402D),
                            collapsedBackgroundColor: const Color(0xFFEF402D),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 5',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 5. Alcançar a\nigualdade de gênero e\nempoderar todas as\nmulheres e meninas',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nVisa alcançar a igualdade\nde gênero e\nempoderamento das\nmulheres. Isso inclui acabar\ncom discriminação e\nviolência, reconhecer\ntrabalho doméstico,\npromover participação\npolítica das mulheres,\ngarantir acesso à saúde\nsexual e reprodutiva, e\nfortalecer políticas de\nigualdade de gênero.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF27BFE6),
                            collapsedBackgroundColor: const Color(0xFF27BFE6),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 6',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 6. Assegurar a\ndisponibilidade e gestão\nsustentável da água e\nsaneamento para todas\ne todos',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nVisa garantir o acesso\nuniversal à água potável\ne saneamento até 2030.\nIsso inclui melhorar a\nqualidade da água,\nreduzir a poluição,\naumentar a eficiência no\nuso da água e enfrentar\na escassez hídrica.\nTambém propõe a\ngestão integrada dos\nrecursos hídricos,\nproteção de\necossistemas\nrelacionados à água e\ncooperação internacional\npara apoiar países em\ndesenvolvimento. Além\ndisso, busca fortalecer a\nparticipação das\ncomunidades locais na\ngestão da água e\nsaneamento.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFFBC412),
                            collapsedBackgroundColor: const Color(0xFFFBC412),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 7',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 7. Assegurar o\nacesso confiável,\n sustentável, moderno e\na preço acessível à\nenergia para todas e\ntodos',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nVisa garantir acesso\nuniversal a serviços de\nenergia até 2030, com\nênfase em energias\nrenováveis e eficiência\nenergética. Isso inclui\naumentar a participação\ndas energias renováveis,\ndobrar a taxa de melhoria\nda eficiência energética e\nfortalecer a cooperação\ninternacional para\npesquisa e tecnologias de\nenergia limpa.\nAlém disso, propõe\nexpandir a infraestrutura de\nenergia sustentável nos\npaíses em\ndesenvolvimento,\n especialmente os menos\ndesenvolvidos e os\npequenos Estados insulares\nem desenvolvimento.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFA31C44),
                            collapsedBackgroundColor: const Color(0xFFA31C44),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 8',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 8. Promover o\ncrescimento econômico\nsustentado, inclusivo e\nsustentável, emprego\npleno e produtivo e\ntrabalho decente para\ntodas e todos',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nBusca promover o\ncrescimento econômico\nsustentável e emprego\ndecente. Isso inclui\nsustentar o crescimento do\nPIB nos países menos\ndesenvolvidos, aumentar a\nprodutividade, promover\npolíticas de\ndesenvolvimento, melhorar\na eficiência no uso de\nrecursos e erradicar o\ntrabalho forçado e infantil.\nTambém visa garantir\nambientes de trabalho\nseguros e promover o\nturismo sustentável, além\nde expandir o acesso aos\nserviços financeiros e\napoiar o comércio nos\npaíses em desenvolvimento.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFF26A2E),
                            collapsedBackgroundColor: const Color(0xFFF26A2E),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 9',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 9. Construir\ninfraestruturas\nresilientes, promover a\nindustrialização\ninclusiva e sustentável e\nfomentar a inovação',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nO Objetivo 9 da Agenda\n2030 busca promover\n infraestrutura sustentável e\nindustrialização inclusiva.\nIsso inclui desenvolver\ninfraestrutura de qualidade,\nacessível e resiliente para\napoiar o crescimento\neconômico e o bem-estar\nhumano, especialmente em\náreas regionais e\ntransfronteiriças. É também\nsobre aumentar a\nparticipação da indústria no\nemprego e no PIB, fortalecer\npequenas indústrias com\nacesso a serviços\nfinanceiros, modernizar e\ntornar sustentáveis as\nindústrias, promover\npesquisa e inovação\ntecnológica, facilitar o\ndesenvolvimento de\ninfraestrutura em países em\ndesenvolvimento, apoiar\ntecnologia e inovação\nnacional, e melhorar o\nacesso à tecnologia da\ninformação e comunicação,\n incluindo internet acessível\nnos países menos\ndesenvolvidos.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFDE1768),
                            collapsedBackgroundColor: const Color(0xFFDE1768),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 10',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 10. Reduzir a\ndesigualdade dentro\ndos países e entre eles',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nO Objetivo 10 da Agenda\n2030 visa reduzir as\ndesigualdades dentro e\nentre os países.\nIsso inclui alcançar um\ncrescimento de renda mais\nrápido para os 40% mais\npobres da população,\npromover a inclusão social,\neconômica e política para\ntodos, eliminar práticas\ndiscriminatórias, adotar\npolíticas fiscais e de\nproteção social para\naumentar a igualdade,\nfortalecer a\nregulamentação financeira\nglobal, aumentar a\nrepresentação dos países\nem desenvolvimento em\ninstituições financeiras\ninternacionais, facilitar a\nmigração segura e\nordenada, implementar\ntratamento especial para\npaíses em desenvolvimento,\naumentar a assistência ao\ndesenvolvimento, e reduzir\nos custos de transação de\nremessas dos migrantes.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFF89D2A),
                            collapsedBackgroundColor: const Color(0xFFF89D2A),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 11',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 11. Tornar as\ncidades e os\nassentamentos\nhumanos inclusivos,\nseguros, resilientes e\nsustentáveis',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nO Objetivo 11 da Agenda 2030\nvisa tornar as cidades e\nassentamentos humanos\ninclusivos, seguros, resilientes\ne sustentáveis.\nIsso inclui garantir acesso à\nhabitação segura e acessível,\nurbanizar favelas, melhorar\nsistemas de transporte\nsustentáveis e seguros,\npromover urbanização\ninclusiva e capacidades de\ngestão de assentamentos\nhumanos, proteger\npatrimônios cultural e\nnatural, reduzir mortes e\nimpactos econômicos de\ndesastres, diminuir o impacto\nambiental das cidades,\nproporcionar acesso\nuniversal a espaços públicos\nseguros e verdes, apoiar\nrelações positivas entre\náreas urbanas, periurbanas e\nrurais, implementar políticas\npara mitigação e adaptação\nàs mudanças climáticas, e\napoiar construções\nsustentáveis em países\nmenos desenvolvidos.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFFBF8D2C),
                            collapsedBackgroundColor: const Color(0xFFBF8D2C),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 12',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 12. Assegurar\npadrões de produção e\nde consumo sustentáveis',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nO Objetivo 12 da Agenda\n2030 visa promover\npadrões sustentáveis de\nprodução e consumo.\nIsso inclui implementar o\nPlano Decenal de\nProgramas sobre Produção\ne Consumo Sustentáveis,\nalcançar gestão\nsustentável e uso eficiente\ndos recursos naturais,\nreduzir desperdício de\nalimentos e perdas ao\nlongo das cadeias de\nprodução, alcançar manejo\nambientalmente saudável\nde produtos químicos e\nresíduos, reduzir geração\nde resíduos através de\nprevenção, redução,\nreciclagem e reuso,\nincentivar práticas\nsustentáveis nas empresas,\npromover compras\npúblicas sustentáveis,\naumentar a\nconscientização sobre\ndesenvolvimento sustentável,\napoiar capacidades científicas e\ntecnológicas em países em\ndesenvolvimento, monitorar\nimpactos do turismo\nsustentável, e racionalizar\nsubsídios aos combustíveis\nfósseis de forma a\nminimizar impactos\nadversos e proteger\ncomunidades afetadas.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF407F46),
                            collapsedBackgroundColor: const Color(0xFF407F46),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 13',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 13. Tomar\nmedidas urgentes para\ncombater a mudança\nclimática e seus impactos',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nReforçar a resiliência e a\ncapacidade de adaptação\na riscos relacionados ao\nclima e às catástrofes\nnaturais em todos os países\nIntegrar medidas da\nmudança do clima nas\npolíticas, estratégias e\nplanejamentos nacionais\nMelhorar a educação,\naumentar a conscientização\ne a capacidade humana e\ninstitucional sobre\nmitigação, adaptação\nredução de impacto e\nalerta precoce da\nmudança do clima.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF1F87D4),
                            collapsedBackgroundColor: const Color(0xFF1F87D4),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 14',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 14.\nConservaçãoe uso\nsustentável dos oceanos,\ndos mares e dos\nrecursos marinhos para o\ndesenvolvimento sustentável',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nAté 2025, prevenir e reduzir\nsignificativamente a poluição\nmarinha de todos os tipos,\nespecialmente a advinda de\natividades terrestres, incluindo\ndetritos marinhos e\na poluição por nutrientes.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF4DB638),
                            collapsedBackgroundColor: const Color(0xFF4DB638),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 15',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 15. Proteger,\nrecuperar e promover o\nuso sustentável dos\necossistemas\nterrestres, gerir de\nforma sustentável as\nflorestas, combater a\ndesertificação, deter e\nreverter a degradação\nda terra e deter a perda\nde biodiversidade',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nGarantir uma repartição\njusta e equitativa dos\nbenefícios derivados da\nutilização dos recursos\ngenéticos e promover o\nacesso adequado aos\nrecursos genéticos\nTomar medidas urgentes\npara acabar com a caça\nilegal e o tráfico de\nespécies da flora e fauna\nprotegidas e abordar tanto\na demanda quanto a\noferta de produtos ilegais\nda vida selvagem\nMobilizar e aumentar\nsignificativamente, a partir\nde todas as fontes, os\nrecursos financeiros para a\nconservação e o uso\nsustentável da\nbiodiversidade e dos\necossistemasMobilizar recursos\nsignificativos de todas as\nfontes e em todos os níveis\npara financiar o manejo\nflorestal sustentável e\nproporcionar incentivos\nadequados aos países em\ndesenvolvimento para\npromover o manejo\nflorestal sustentável,\ninclusive para a\nconservação e o\nreflorestamento\nReforçar o apoio global\npara os esforços de\ncombate à caça ilegal e ao\ntráfico de espécies\nprotegidas, inclusive por\nmeio do aumento da\ncapacidade das\ncomunidades locais para\nbuscar oportunidades de\nsubsistência sustentável.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF136A9F),
                            collapsedBackgroundColor: const Color(0xFF136A9F),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 16',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 16. Promover\nsociedades pacíficas e\ninclusivas para o\ndesenvolvimento\nsustentável,\nproporcionar o acesso\nà justiça para todos e\nconstruir instituições\neficazes, responsáveis\ne inclusivas em todos\nos níveis',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nReduzir significativamente\ntodas as formas de\nviolência e as taxas de\nmortalidade relacionada\nem todos os lugares\nAcabar com abuso,\nexploração, tráfico e todas\nas formas de violência e\ntortura contra crianças\nPromover o Estado de\nDireito, em nível nacional e\ninternacional, e garantir a\nigualdade de acesso à\njustiça para todos.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: ExpansionTile(
                            backgroundColor: const Color(0xFF14496B),
                            collapsedBackgroundColor: const Color(0xFF14496B),
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Objetivo 17',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.05),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Objetivo 17. Fortalecer os\nmeios de\nimplementação e\nrevitalizar a parceria\nglobal para o\ndesenvolvimento sustentável',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nFINANÇAS:\nFortalecer a mobilização de\nrecursos internos, inclusive\npor meio do apoio\ninternacional aos países em\ndesenvolvimento, para\nmelhorar a capacidade\nnacional para arrecadação\nde impostos e outras receitas.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                     Row(
                                      children: [
                                        Text(
                                          '\nTECNOLOGIA:\nPromover o desenvolvimento,\na transferência, a\ndisseminação e a difusão\nde tecnologias\nambientalmente corretas\npara os países em\ndesenvolvimento, em\ncondições favoráveis,\ninclusive em condições\nconcessionais e\npreferenciais, conforme\nmutuamente acordado',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nCAPACITAÇÃO:\nReforçar o apoio\ninternacional para a\nimplementação eficaz e\norientada da capacitação\nem países em\ndesenvolvimento, a fim de\napoiar os planos nacionais\npara implementar todos os\nobjetivos de desenvolvimento\nsustentável, inclusive por\nmeio da cooperação Norte-Sul,\nSul-Sul e triangular.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\nCOMÉRCIO:\nPromover um sistema\nmultilateral de comércio\nuniversal, baseado em\nregras, aberto, não\ndiscriminatório e equitativo\nno âmbito da Organização\nMundial do Comércio,\ninclusive por meio da\nconclusão das negociações\nno âmbito de sua Agenda\nde Desenvolvimento de Doha.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                     Row(
                                      children: [
                                        Text(
                                          '\nQUESTÕES SISTÊMICAS:\nCoerência de políticas e\ninstitucional.\nAumentar a estabilidade\nmacroeconômica global,\ninclusive por meio da\ncoordenação e da coerência\nde políticas\nAumentar a coerência das\npolíticas para o\ndesenvolvimento sustentável\nRespeitar o espaço político\ne a liderança de cada país\npara estabelecer e\nimplementar políticas para\na erradicação da pobreza e\no desenvolvimento sustentável.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                     Row(
                                      children: [
                                        Text(
                                          '\nAS PARCERIAS MULTISSETORIAIS:\nReforçar a parceria global\npara o desenvolvimento\nsustentável,\ncomplementada por\nparcerias multissetoriais\nque mobilizem e\ncompartilhem\nconhecimento, expertise,\ntecnologia e recursos\nfinanceiros, para apoiar a\nrealização dos objetivos do\ndesenvolvimento\nsustentável em todos os\npaíses, particularmente nos\npaíses em desenvolvimento\nIncentivar e promover\nparcerias públicas,\npúblico-privadas\ne com a sociedade\ncivil eficazes, a partir da\nexperiência das estratégias de\nmobilização de recursos\ndessas parcerias.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                     Row(
                                      children: [
                                        Text(
                                          '\nDADOS, MONITORAMNETO\nE PRESTAÇÃO DE CONTAS:\nAté 2030, valer-se de\niniciativas existentes para\ndesenvolver medidas\ndo progresso do\ndesenvolvimento\nsustentável que\ncomplementem o produto\ninterno bruto [PIB] e apoiem\na capacitação estatística\nnos países em desenvolvimento.',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                ],
              ),
            )));
  }
}
