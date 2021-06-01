import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  static final String API_URL = "http://192.168.1.104:8000";
  static final int SUCESSO = 200;
  static final int CRIADO = 201;
  static final int ACESSO_NEGADO = 403;

  static Uri getURI(String endpoint) {
    return Uri.parse("$API_URL/$endpoint/");
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

    Map<String, String> header = {"Authorization": _token};
    Uri uri = getURI("login");
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
    String body = json.encode(dados);
    Map<String, String> header = {
      "Authorization": _token,
      "Content-Length": body.length.toString(),
      "Content-Type": "application/json",
    };
    Uri uri = getURI(endpoint);
    http.Response response = await http.post(uri, body: body, headers: header);
    print("Post: $dados");
    print("Response:" + response.body);

    return response;
  }

  Future<http.Response> get(String endpoint,
      {Map<String, String> header}) async {
    Map<String, String> header = {"Authorization": _token};
    Uri uri = getURI(endpoint);
    return await http.get(uri, headers: header);
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> dados,
      {Map<String, String> header}) async {
    String body = json.encode(dados);
    Map<String, String> header = {
      "Authorization": _token,
      "Content-Length": body.length.toString(),
      "Content-Type": "application/json",
    };
    Uri uri = getURI(endpoint);
    return await http.put(uri, body: body, headers: header);
  }
}
