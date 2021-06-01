import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  static final String API_URL_MIKA = "http://192.168.1.103:8080";
  static final int SUCESSO = 200;
  static final int CRIADO = 201;
  static final int ACESSO_NEGADO = 403;

  static Uri getUriMika(String endpoint) {
    return Uri.parse("$API_URL_MIKA/$endpoint/");
  }

  static final String API_URL_GUI = "http://192.168.1.103:8000";

  static Uri getUriGui(String endpoint) {
    return Uri.parse("$API_URL_GUI/$endpoint");
  }

  static ApiController _instance;

  static ApiController instance() {
    if (_instance == null) {
      _instance = new ApiController();
    }
    return _instance;
  }

  String _token;

  Future<int> autenticar(String email, String senha) async {
    Map<String, dynamic> dados = {"email": email, "senha": senha};

    Map<String, String> header = {
      "Authorization": _token
    }; //aqui ele faz o login
    Uri uri = getUriMika("login"); //aqui ele busca a url
    http.Response response = await http.post(uri, body: dados, headers: header);

    if (response.statusCode == 200) {
      _token = json.decode(response.body)['Token'];
      _token = "Basic $_token";
      print(_token);
      return 200;
    }
    return response.statusCode;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> dados,
      {Map<String, String> header}) async {
    Map<String, String> header = {
      "Authorization": _token,
      "Content-Type": "Application/JSON"
    }; //aqui ele faz o login
    Uri uri = getUriMika(endpoint); //aqui ele busca a url

    print("Postando $dados");

    return await http.post(uri,
        body: dados.toString(), headers: header); // e então faz o post
  }

  Future<http.Response> get(String endpoint,
      {Map<String, String> header}) async {
    Map<String, String> header = {
      "Authorization": _token,
      "Content-Type": "Application/JSON"
    };
    Uri uri = getUriMika(endpoint);
    return await http.get(uri, headers: header);
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> dados,
      {Map<String, String> header}) async {
    Map<String, String> header = {
      "Authorization": _token,
      "Content-Type": "Application/JSON"
    };
    Uri uri = getUriMika(endpoint);
    return await http.put(uri, body: dados.toString(), headers: header);
  }
}
