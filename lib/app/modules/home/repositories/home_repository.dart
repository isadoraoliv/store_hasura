import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:store_hasura/app/modules/home/models/produto_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasura_connect;

  HomeRepository(this._hasura_connect);

  Future<List<ProdutoModel>> getProduto() async {
    var query = '''
          query getProdutos {
            produto {
              id
              nome
              valor
            tipo_produto {
              descricao
            }
            categoria_produto {
              descricao
            }
          }
        }''';

    var snapshot = await _hasura_connect.query(query);

    return ProdutoModel.fromJsonList(snapshot['data']["produto"] as List);
  }

  @override
  void dispose() {}
}
