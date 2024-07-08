import 'dart:convert';
import 'package:http/http.dart' as http;

class Cidade {
  final int id;
  final String nome;

  Cidade({required this.id, required this.nome});

  factory Cidade.fromJson(Map<String, dynamic> json) {
    return Cidade(
      id: json['id'],
      nome: json['nome'],
    );
  }

  static Future<List<Cidade>> getCidades(String estadoId) async {
    final response = await http.get(Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId/municipios'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Cidade.fromJson(e)).toList();
    } else {
      throw Exception('Falha ao carregar cidades');
    }
  }
}
