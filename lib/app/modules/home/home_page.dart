import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store_hasura/app/modules/home/widgets/card_produto/card_produto_widget.dart';
import 'home_controller.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Store Hasura"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  HomeController homeController = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: homeController.listaProdutos.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProdutoWidget(
                    nomeProduto: homeController.listaProdutos[index].nome,
                    categoriaProduto: homeController
                        .listaProdutos[index].categoriaProduto.descricao,
                    tipoProduto: homeController
                        .listaProdutos[index].tipoProduto.descricao,
                    valorProduto:
                        homeController.listaProdutos[index].valor.toString(),
                  );
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/AddProduto");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
