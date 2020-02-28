import 'package:flutter/cupertino.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:store_hasura/app/modules/update_produto/repositories/update_produto_repository.dart';
import 'package:store_hasura/app/modules/update_produto/update_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_hasura/app/modules/update_produto/update_produto_page.dart';

import '../../app_module.dart';

class UpdateProdutoModule extends ChildModule {
  final String idProduto;

  UpdateProdutoModule({@required this.idProduto});

  @override
  List<Bind> get binds => [
        Bind((i) => UpdateProdutoController(
            i.get<UpdateProdutoRepository>(), idProduto)),
        Bind((i) => UpdateProdutoRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UpdateProdutoPage()),
      ];

  static Inject get to => Inject<UpdateProdutoModule>.of();
}
