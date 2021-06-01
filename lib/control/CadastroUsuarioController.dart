import 'package:gestao_tads/control/ApiController.dart';
import 'package:gestao_tads/model/usuario.dart';
import 'package:http/http.dart';

class CadastroUsuarioController {
  Future<bool> adicionarUsuario(Usuario usuario) async {
    print(usuario);
    Response response =
        await ApiController.instance().post("usuario", usuario.toMap());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }



}
