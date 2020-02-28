import 'package:mobx/mobx.dart';
import 'package:store_hasura/app/modules/add_produto/repositories/add_produto_repository.dart';

import 'models/tipo_categoria_produto_dto.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {
  final AddProdutoRepository addProdutoRepository;

  _AddProdutoControllerBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  String descricao = " ";

  @action
  setDescricao(String _descricao) {
    descricao = _descricao;
  }

  @observable
  String valor = " ";

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  TipoCategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoCategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoCategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoCategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> salvarProduto() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo != null &&
        selectedCategoria != null) {
      return await addProdutoRepository.addProduto(
          descricao, valor, selectedTipo.id, selectedCategoria.id);
    }
    return false;
  }
}
