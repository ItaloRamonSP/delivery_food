import 'package:http/http.dart' as http;
import 'package:telas/models/result_cep.dart';

class ViaCepService {
  static Future<ResultCep> fetchCep({String? cep}) async {
    var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
