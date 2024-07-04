import 'package:feteps/Menu_Page.dart';
import 'package:feteps/appbar/appbar1_page.dart';
import 'package:feteps/sobre_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart';

class AvaliacaoPage extends StatelessWidget {
  const AvaliacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
          ),
      home: Scaffold(
        appBar: AppBar1_page(screenWidth:  MediaQuery.of(context).size.width * 1.0, destinationPage: SobrePage()),
        endDrawer: const MenuPage(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Digite o código do \nprojeto para avaliar:',
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: const Color(0xFF0E414F),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffD9D9D9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
