import 'package:mobx/mobx.dart';
import 'package:store_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'models/update_tipo_categoria_produto_dto.dart';
import 'repositories/update_produto_repository.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoControllerBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoControllerBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;
  final String idProduto;

  _UpdateProdutoControllerBase(this.updateProdutoRepository, this.idProduto) {
    updateProdutoRepository.updateTipoCategoriaProduto(idProduto).then((data) {
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
  UpdateTipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> salvarProduto() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo != null &&
        selectedCategoria != null) {
      return await updateProdutoRepository.updateProduto(
        idProduto: idProduto,
        descricao: descricao,
        valor: valor,
        selectedTipo: selectedTipo.id,
        selectedCategoria: selectedCategoria.id,
      );
    }
    return false;
  }
}
