import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:store_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';

class AddProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  AddProdutoRepository(this._hasuraConnect);

  Future<TipoCategoriaProdutoDto> getTipoCategoriaProduto() async {
    var query = '''
      query getTipoCategoriaProdutos {
        tipo_produto {
          id
          descricao
        }
        categoria_produto {
          id
          descricao
        }
     }
    ''';

    var snapshot = await _hasuraConnect.query(query);

    return TipoCategoriaProdutoDto.fromMap(snapshot['data']);
  }

  @override
  void dispose() {}
}
