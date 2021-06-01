import 'package:gestao_tads/control/ApiController.dart';
import 'package:gestao_tads/model/usuario.dart';

class CadastroUsuarioController {
  bool adicionarUsuario(Usuario usuario) {
    print(usuario);

    ApiController.instance().post("usuario", usuario.toMap());
  }
}
