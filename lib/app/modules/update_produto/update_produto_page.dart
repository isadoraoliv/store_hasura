import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_hasura/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:store_hasura/app/modules/update_produto/update_produto_controller.dart';
import 'package:store_hasura/app/modules/update_produto/update_produto_module.dart';
import 'package:store_hasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:store_hasura/app/shared/widgets/label/label_widget.dart';

class UpdateProdutoPage extends StatefulWidget {
  final String title;
  const UpdateProdutoPage({Key key, this.title = "UpdateProduto"})
      : super(key: key);

  @override
  _UpdateProdutoPageState createState() => _UpdateProdutoPageState();
}

class _UpdateProdutoPageState
    extends ModularState<UpdateProdutoPage, UpdateProdutoController> {
  var controller = UpdateProdutoModule.to.get<UpdateProdutoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: LabelWidget(title: "Descrição"),
            ),
            TextField(
              onChanged: controller.setDescricao,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              
              ),
              decoration: InputDecoration(
                
                hintText: "Descrição do produto:",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 5),
              child: LabelWidget(title: "Valor:"),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: controller.setValor,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                hintText: "Valor",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),

            ///categoria produto
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 5),
              child: LabelWidget(title: "Categoria do Produto:"),
            ),
            Observer(builder: (_) {
              if (controller.tipoProduto == null) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              }

              return CustomComboboxWidget(
                items: controller.tipoProduto.categoriaProduto
                    .map((data) => Model(data.id, data.descricao))
                    .toList(),
                onChanged: (tipo) => controller.setSelectedTipo(
                  TipoCategoriaDto(id: tipo.id, descricao: tipo.descricao),
                ),
                itemSelecionado: null,
              );
            }),

            ///tipo produto
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LabelWidget(title: "Tipo Produto:"),
            ),
            Observer(builder: (_) {
              if (controller.tipoProduto == null) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              }

              return CustomComboboxWidget(
                items: controller.tipoProduto.tipoProduto
                    .map((data) => Model(data.id, data.descricao))
                    .toList(),
                onChanged: (tipo) => controller.setSelectedCategoria(
                  TipoCategoriaDto(id: tipo.id, descricao: tipo.descricao),
                ),
                itemSelecionado: null,
              );
            }),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  var result = await controller.salvarProduto();

                  if (result) {
                    Navigator.of(context).pop();
                  } else {
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        content: Text("Erro ao tentar salvar o produto!"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
