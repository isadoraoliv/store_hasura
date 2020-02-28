import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:store_hasura/app/modules/update_produto/models/update_tipo_categoria_produto_dto.dart';

class UpdateProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  UpdateProdutoRepository(this._hasuraConnect);

  Future<UpdateTipoCategoriaProdutoDto> updateTipoCategoriaProduto(
      String idProduto) async {
    var query = '''
       query updateTipoCategoriaProdutos(\$idProduto: uuid) {
          tipo_produto {
            id
            descricao
          }
          categoria_produto {
            id
            descricao
          }
          produto(where: {id: {_eq: \$idProduto}}) {
            id
            nome
            tipo_produto_id
            categoria_produto{
              id
              descricao
            }
            tipo_produto{
              id
              descricao
            }
          }
        }
    ''';

    var snapshot =
        await _hasuraConnect.query(query, variables: {"idProduto": idProduto});

    return UpdateTipoCategoriaProdutoDto.fromMap(snapshot['data']);
  }

  Future<bool> updateProduto({
    String idProduto,
    String descricao,
    String valor,
    String selectedTipo,
    String selectedCategoria,
  }) async {
    var mutation = '''
      mutation updateProduto(\$idProduto: uuid, \$nome: String,\$categoria: uuid, \$tipo: uuid, \$valor: float8) {
        update_produto(where: {id: {_eq: \$idProduto}}, 
          _set: {nome: \$nome, 
            tipo_produto_id:\$tipo, 
            valor:\$valor, 
            categoria_produto_id:\$categoria})
      }
    ''';

    var snapshot = await _hasuraConnect.mutation(mutation, variables: {
      "nome": descricao,
      "valor": valor,
      "categoria": selectedCategoria,
      "tipo": selectedTipo,
      "idProduto": idProduto,
    });

    return snapshot["data"]["update_produto"]["affected_rows"] > 0;
  }

  @override
  void dispose() {}
}
