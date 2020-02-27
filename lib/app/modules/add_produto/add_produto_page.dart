import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_hasura/app/modules/add_produto/add_produto_module.dart';
import 'package:store_hasura/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:store_hasura/app/shared/widgets/label/label_widget.dart';
import 'add_produto_controller.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState
    extends ModularState<AddProdutoPage, AddProdutoController> {
  final AddProdutoController controller = AddProdutoModule.to.get();

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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                onChanged: (item) {
                  print(item.descricao);
                },
                itemSelecionado: null,
              );
            }),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                onChanged: (item) {
                  print(item.descricao);
                },
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
                onPressed: () {},
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
