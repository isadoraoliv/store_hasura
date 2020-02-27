import 'package:mobx/mobx.dart';
import 'package:store_hasura/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:store_hasura/app/modules/home/models/produto_model.dart';

import 'models/tipo_categoria_produto_dto.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {
  final AddProdutoRepository addProdutoRepository;

  @observable
  int value = 0;

  _AddProdutoControllerBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  void increment() {
    value++;
  }
}
