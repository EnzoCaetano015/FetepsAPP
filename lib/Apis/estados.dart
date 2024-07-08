import 'dart:convert';
import 'package:http/http.dart' as http;

class Estado {
  String id;
  String nome;

  Estado({
    required this.id,
    required this.nome,
  });

  static Future<List<Estado>> getEstados() async {
    var url = Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
    
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Estado> estados = data.map((e) => Estado(
          id: e['id'].toString(),
          nome: e['nome'],
        )).toList();
        return estados;
      } else {
        throw Exception('Failed to load states');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
